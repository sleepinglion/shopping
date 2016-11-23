class Admin::OrdersController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @sub_menu=t(:menu_order)
    @controller_name=t('activerecord.models.order')
  end

  # GET /order
  # GET /order.json
  def index
    @orders = Order.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @orders }
    end
  end

  # GET /order/1
  # GET /order/1.json
  def show
  end

  # GET /order/new
  # GET /order/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @order }
    end
  end

  # GET /order/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /order
  # POST /order.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to admin_order_path(@order), :notice => @controller_name +t(:message_success_insert)  }
        format.json { render :json => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /order/1
  # PUT /order/1.json
  def update
    respond_to do |format|
      if @order.update_attributes(order_params)
        format.html { redirect_to admin_order_path(@order), :notice =>@controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /order/1
  # DELETE /order/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to admin_orders_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @shipping = Shipping.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:user_id,:shipping_id,:payment_id,:enable,:created_at,:updated_at)
  end
end
