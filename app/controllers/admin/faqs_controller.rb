class Admin::FaqsController < Admin::AdminController
  before_action :set_faq, only: [:show, :edit, :update, :destroy]

  # GET /faqs
  # GET /faqs.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    faq_category_condition = {enable: true}

    @faq_categories = FaqCategory.where(faq_category_condition)

    if params[:faq_category_id]
      @faq_category = FaqCategory.find(params[:faq_category_id])
    else
      unless @faq_categories.empty?
        @faq_category = @faq_categories.first
      end
    end

    condition = { }

    if @faq_category.present?
      condition[:faq_category_id] = @faq_category.id
    end

    @faq_count = Faq.where(condition).count
    @faqs = Faq.where(condition).page(params[:page]).per(params[:per_page]).order('id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faqs }
    end
  end

  # GET /faqs/1
  # GET /faqs/1.json
  def show; end

  # GET /faqs/new
  # GET /faqs/new.json
  def new
    @faq = Faq.new
    @faq.build_faq_content

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faq }
    end
  end

  # GET /faqs/1/edit
  def edit
  end

  # POST /faqs
  # POST /faqs.json
  def create
    @faq = Faq.new(faq_params)

    respond_to do |format|
      if @faq.save
        format.html { redirect_to admin_faq_path(@faq), notice: t(:message_success_insert) }
        format.json { render json: @faq, status: :created, location: @faq }
      else
        format.html { render :new }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faqs/1
  # PATCH/PUT /faqs/1.json
  def update
    @script = 'admin/new'

    respond_to do |format|
      if @faq.update(faq_params)
        format.html { redirect_to admin_faq_path(@faq), notice: t(:message_success_update) }
        format.json { render :show, status: :ok, location: @faq }
      else
        format.html { render :edit }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1
  # DELETE /faqs/1.json
  def destroy
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to admin_faqs_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_faq
    @faq = Faq.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def faq_params
    params.require(:faq).permit(:faq_category_id, :title, :display, :enable, faq_content_attributes: [:content])
  end
end
