class Admin::ProductCategoriesController < Admin::AdminController
  before_action :set_product_category, only: [:show, :edit, :update, :destroy]

  # GET /Products
  # GET /Products.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    condition = { }

    @product_category_count = ProductCategory.where(condition).count
    @product_categories = ProductCategory.where(condition).page(params[:page]).per(params[:per_page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_categories }
    end
  end

  # GET /Products/1
  # GET /Products/1.json
  def show
  end

  # GET /Products/new
  def new
    @product_category = ProductCategory.new
  end

  # GET /Products/1/edit
  def edit
  end

  # POST /Products
  # POST /Products.json
  def create
    @product_category = ProductCategory.new(product_category_params)

    respond_to do |format|
      if @product_category.save
        format.html { redirect_to [:admin, @product_category], notice: 'Gg was successfully created.' }
        format.json { render :show, status: :created, location: @product_category }
      else
        format.html { render :new }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Products/1
  # PATCH/PUT /Products/1.json
  def update
    respond_to do |format|
      if @product_category.update(product_category_params)
        format.html { redirect_to [:admin, @product_category], notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_category }
      else
        format.html { render :edit }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Products/1
  # DELETE /Products/1.json
  def destroy
    @product_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_categories_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product_category
    @product_category = ProductCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_category_params
    params.require(:product_category).permit(:title, :enable)
  end
end
