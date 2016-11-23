class Admin::PaymentsController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @sub_menu=t(:menu_payment)
    @controller_name=t('activerecord.models.payment')
  end

  # GET /payment
  # GET /payment.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10
    end

    if params[:search_type].present?
      likesql='payments.title like ?'
      likep= '%'+params[:search_value].strip+'%'
    end

    if(params[:search_type] && params[:search_value])
      puts 'awegwaegwa';
      @payments = Payment.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
    else
      @payments = Payment.order('id desc').page(params[:page]).per(params[:per_page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @payments }
    end
  end

  # GET /payment/1
  # GET /payment/1.json
  def show
  end

  # GET /payment/new
  # GET /payment/new.json
  def new
    @payment = Payment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @payment }
    end
  end

  # GET /payment/1/edit
  def edit
  end

  # POST /payment
  # POST /payment.json
  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to admin_payment_path(@payment), :notice => @controller_name +t(:message_success_insert)  }
        format.json { render :json => @payment, :status => :created, :location => @payment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payment/1
  # PUT /payment/1.json
  def update
    respond_to do |format|
      if @payment.update_attributes(payment_params)
        format.html { redirect_to admin_payment_path(@payment), :notice =>@controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payment/1
  # DELETE /payment/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to admin_payments_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def payment_params
    params.require(:payment).permit(:title,:enable)
  end
end
