class Admin::OperatorsController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_operator, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @category=t(:menu_user)
    @sub_menu=t(:submenu_operator)
    @controller_name=t('activerecord.models.operator')
  end

  # GET /admins
  # GET /admins.json
  def index
    @operators = Operator.where(:parent_id=>current_admin).order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @operators }
    end
  end

  def show
  end

  # GET /admins/new
  # GET /admins/new.json
  def new
    @operator = Operator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @operator }
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @operator = Operator.new(operator_params)
    @operator.transaction do
      @or=@operator.save
      RolesAdmin.create(:role_id=>params[:role_id],:admin_id=>@operator.id)
    end

    respond_to do |format|
      if @or
        format.html { redirect_to admin_operator_path(@operator), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @operator, :status => :created, :location => @operator }
      else
        format.html { render :action => "new" }
        format.json { render :json => @operator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @operator.transaction do
      @or=@operator.update_attributes(operator_params)
      @operator.roles_admin[0].update_attributes(:role_id=>params[:role_id],:admin_id=>@operator.id)
    end

    respond_to do |format|
      if @or
        format.html { redirect_to admin_operator_path(@operator), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @operator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @operator.destroy

    respond_to do |format|
      format.html { redirect_to admin_operators_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_operator
    @operator = Operator.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def operator_params
    params.require(:operator).permit(:login_id,:parent_id,:nickname,:email,:password,:password_confirmation,:enable)
  end
end
