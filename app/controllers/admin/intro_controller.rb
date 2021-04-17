class Admin::IntroController < Admin::AdminController
  before_action :set_intro, only: [:edit, :update]

  # GET /location
  # GET /location.json
  def index
    @intro=Intro.first
  end

  # GET /intro/1/edit
  def edit; end

  # PATCH/PUT /intro/1
  # PATCH/PUT /intro/1.json
  def update
    respond_to do |format|
      if @intro.update(intro_params)
        format.html { redirect_to admin_intro_index_path(@intro), notice: t(:message_success_update) }
        format.json { render :show, status: :ok, intro: admin_intro_index_path(@intro) }
      else
        format.html { render :edit }
        format.json { render json: @intro.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_intro
    @intro = Intro.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def intro_params
    params.require(:intro).permit(:title, :content, :enable)
  end
end
