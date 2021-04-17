class Admin::FaqCategoriesController < Admin::AdminController
  before_action :set_faq_category, only: [:show, :edit, :update, :destroy]

  # GET /report_categories
  # GET /report_categories.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    condition = {}

    @faq_category_count = FaqCategory.where(condition).count
    @faq_categories = FaqCategory.where(condition).page(params[:page]).per(params[:per_page])
  end

  # GET /report_categories/1
  # GET /report_categories/1.json
  def show; end

  # GET /report_categories/new
  # GET /report_categories/new.json
  def new
    @faq_category = FaqCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faq_category }
    end
  end

  # GET /report_categories/1/edit
  def edit; end

  # POST /report_categories
  # POST /report_categories.json
  def create
    @faq_category = FaqCategory.new(faq_category_params)

    respond_to do |format|
      if @faq_category.save
        format.html { redirect_to admin_faq_category_path(@faq_category), notice: t(:message_success_insert) }
        format.json { render json: @faq_category, status: :created, location: @faq_category }
      else
        format.html { render :new }
        format.json { render json: @faq_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_categories/1
  # PATCH/PUT /report_categories/1.json
  def update
    respond_to do |format|
      if @faq_category.update(faq_category_params)
        format.html { redirect_to admin_faq_category_path(@faq_category), notice: t(:message_success_update) }
        format.json { render :show, status: :ok, location: @faq_category }
      else
        format.html { render :edit }
        format.json { render json: @faq_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_categories/1
  # DELETE /report_categories/1.json
  def destroy
    @faq_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_faq_categories_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_faq_category
    @faq_category = FaqCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def faq_category_params
    params.require(:faq_category).permit(:title, :sub_title, :color, :enable)
  end
end
