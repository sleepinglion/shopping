class Admin::ProductsController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @sub_menu=t(:menu_product)
    @controller_name=t('activerecord.models.product')
  end

  # GET /product
  # GET /product.json
  def index
    @products = Product.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @products }
    end
  end

  # GET /product/1
  # GET /product/1.json
  def show
    @product = Product.find(params[:id])
    @product_pictures=@product.product_picture.order('id asc')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product }
    end
  end

  # GET /product/new
  # GET /product/new.json
  def new
    @product = Product.new
    @script='admin/new.js'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product }
    end
  end

  # GET /product/1/edit
  def edit
    @script='admin/new.js'    
    @product = Product.find(params[:id])
  end

  # POST /product
  # POST /product.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_path(@product), :notice => @controller_name +t(:message_success_insert)  }
        format.json { render :json => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product/1
  # PUT /product/1.json
  def update
    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to admin_product_path(@product), :notice =>@controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product/1
  # DELETE /product/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_products_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:title,:price,:shipping_price,:description,:enable)
  end
end
