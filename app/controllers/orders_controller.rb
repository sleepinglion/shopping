class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    if params[:product_id]
      product_id=params[:product_id]
    end

    @product=Product.find(product_id)

    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def calculate_account(s, payment_method)
    a = { total_price: 0 }
    if s.empty?
      return a
    end

    s.each do |ss|
      pp = ss.price * ss.quantity

      a[:total_price]+=pp
    end

    return a
  end

  # POST /orders
  # POST /orders.json
  def create
    result = false

    begin

      @order = Order.new(order_params)
      @order.save!

      ca = calculate_account(@order.orders_products,params[:payment_method])
      account = Account.create!(order_params.merge(:account_category_id=>1).except(:orders_products_attributes))

      @order.orders_products.each do |order_product|
        @accounts_product=AccountsProduct.create!(:account_id=>account.id, :product_id=>order_product.product_id)
      end

      @accounts_order = AccountsOrder.create!(:account_id => account.id, :order_id => @order.id)
      AccountsPayment.create!(:account_id => account.id, :payment_id=>params[:payment_method])
      @order.update(total_price: ca[:total_price], total_payment: ca[:total_price])
      result = true

      respond_to do |format|
        if result
          format.html { redirect_to order_path(@order), notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end

    rescue ActiveRecord::RecordInvalid => exception
      flash[:alert]=exception.message
      redirect_to new_order_path(:product_id=>params[:product_id])
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete

  end


  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit( :last_transaction_date, :total_price, :total_discount,:total_payment, orders_products_attributes: [:id, :product_id, :price, :quantity]).merge(user_id: current_user.id)
  end
end
