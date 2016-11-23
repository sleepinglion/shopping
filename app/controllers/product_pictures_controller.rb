class ProductPicturesController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_product_picture, only: [:show, :edit, :update, :destroy]
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_ad)
    @controller_name=t('activerecord.models.product_picture')    
  end
  
  def edit
  end
  
  def show
  end  
  
  def create
    @product = Product.find(params[:product_id])
    @product_picture = @product.product_picture.create(product_picture_params)
    
    redirect_to admin_product_path(@product)
  end
  
  def update
    respond_to do |format|
      if @product_picture.update_attributes(product_picture_params)
        format.html { redirect_to admin_product_path(@product_picture.product), :notice => @controller_name +t(:message_success_update) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product_picture.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @product_picture.destroy

    respond_to do |format|
      format.html { redirect_to admin_product_path(@product_picture.product) }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_picture
      @product_picture = ProductPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_picture_params
      params.require(:product_picture).permit(:photo,:enable)
    end    
end
