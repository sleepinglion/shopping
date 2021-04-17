class Admin::SlidersController < Admin::AdminController
  before_action :set_slider, only: [:show, :edit, :update, :destroy]

  # GET /slider
  # GET /slider.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    @slider_count = Slider.count
    @sliders = Slider.page(params[:page]).per(params[:per_page]).order('id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sliders }
    end
  end

  # GET /sliders/1
  # GET /sliders/1.json
  def show; end

  # GET /sliders/new
  # GET /sliders/new.json
  def new
    @slider = Slider.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @slider }
    end
  end

  # GET /sliders/1/edit
  def edit; end

  # POST /sliders
  # POST /sliders.json
  def create
    @slider = Slider.new(slider_params)

    respond_to do |format|
      if @slider.save
        format.html { redirect_to admin_slider_path(@slider), notice: t(:message_success_insert) }
        format.json { render json: @slider, status: :created, location: admin_slider_path(@slider) }
      else
        format.html { render :new }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sliders/1
  # PATCH/PUT /sliders/1.json
  def update
    respond_to do |format|
      if @slider.update(slider_params)
        format.html { redirect_to admin_slider_path(@slider), notice: t(:message_success_update) }
        format.json { render :show, status: :ok, location: admin_slider_path(@slider) }
      else
        format.html { render :edit }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sliders/1
  # DELETE /sliders/1.json
  def destroy
    @slider.destroy
    respond_to do |format|
      format.html { redirect_to admin_sliders_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_slider
    @slider = Slider.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def slider_params
    params.require(:slider).permit(:title, :description, :link, :picture, :enable)
  end
end
