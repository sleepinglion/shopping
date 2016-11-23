class ShippingsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_shipping, only: [:show, :edit, :update, :destroy]
  
  def initialize(*params)
    super(*params)
    
    @sub_menu=t(:menu_shipping)    
    @controller_name=t('activerecord.models.shipping')
  end  
  
  # GET /shipping
  # GET /shipping.json
  def index
    @shippings = Shipping.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @shippings }
    end
  end

  # GET /shipping/1
  # GET /shipping/1.json
  def show
  end

  # GET /shipping/new
  # GET /shipping/new.json
  def new
    @shipping = Shipping.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @shipping }
    end
  end

  # GET /shipping/1/edit
  def edit
  end

  # POST /shipping
  # POST /shipping.json
  def create
    @shipping = Shipping.new(shipping_params)

    respond_to do |format|
      if @shipping.save
        format.html { redirect_to admin_shipping_path(@shipping), :notice => @controller_name +t(:message_success_insert)  }
        format.json { render :json => @shipping, :status => :created, :location => @shipping }
      else
        format.html { render :action => "new" }
        format.json { render :json => @shipping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shipping/1
  # PUT /shipping/1.json
  def update
    respond_to do |format|
      if @shipping.update_attributes(shipping_params)
        format.html { redirect_to admin_shipping_path(@shipping), :notice =>@controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @shipping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shipping/1
  # DELETE /shipping/1.json
  def destroy
    @shipping.destroy

    respond_to do |format|
      format.html { redirect_to admin_shippings_path }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping
      @shipping = Shipping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipping_params
      params.require(:shipping).permit(:name,:email,:phone,:zip_code,:address_default,:address_detail,:same_order,:enable)
    end   
end
