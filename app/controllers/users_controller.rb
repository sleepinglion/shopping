class UsersController < ApplicationController
  include Admin::SearchDate
  impressionist
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  def initialize(*params)
    super(*params)

    @category=t(:menu_user)
    @sub_menu=t(:submenu_user)
    @controller_name=t('activerecord.models.user')
  end

  def user_id_select
    @script='users/user_id_select'
  end

  def user_id_select_search_result
    case params[:find_method]
      when 'login_id'
        condition_sql='username like ?'
      when 'email'
        condition_sql='email like ?'
      when 'user_id'
        condition_sql='id like ?'
      when 'market'
        condition_sql='market like ?'
    end

    unless params[:per_page].present?
      params[:per_page]=20
    end

    @user_count = User.order('id desc').where(condition_sql,'%'+params[:search].strip+'%').count
    @users = User.order('id desc').where(condition_sql,'%'+params[:search].strip+'%').page(params[:page]).per(params[:per_page])

    @script='users/user_id_select'

    if(@user_count.zero?)
      a={:count=>@user_count}
    else
      a={:count=>@user_count,:list=>@users}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => a }
      format.xls
    end
  end

  # GET /users
  # GET /users.json
  def index
    if params[:login_id].present? || params[:cell_phone].present?
      likesql='1=1'
      likep=[]
    end

    unless params[:per_page].present?
      params[:per_page]=20
    end

    if params[:format]=='xls'
      params[:page]=nil
      params[:per_page]=500000
    end

    conditions={}
    conditions[:user_id]=params[:user_id] if params[:user_id].present?
    conditions[:flag]=params[:flag] if params[:flag].present?


    @users = User.where('1=1')

    if params[:cell_phone].present?
      @users = @users.where('mobile_num like ?', params[:cell_phone].strip+'%')
    end
    if params[:login_id].present?
      @users = @users.where('username like ?', '%'+params[:login_id].strip+'%')
    end
    if params[:market].present?
      @users = @users.where('market like ?', params[:market].strip)
    end
    if params[:start_date].present? and params[:date_p] != 'false'
      @users = @users.where(:created_at => (change_date(params[:start_date],false))..(change_date(params[:end_date])))
    end
    @users = @users.order('id desc').page(params[:page]).per(params[:per_page])

    @users_count=User.count
    #@users_active_count=User.count(:conditions=>{:flag=>true})
    @users_disable_count=2568
    @users_active_count=@users_count - @users_disable_count
    @script='users/index'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @script='users/new'
  end

  # GET /users/1/edit
  def edit
    @script='users/new'
  end

  # POST /users
  # POST /users.json
  def create

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_path(@user), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_path(@user), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
   @delete_user=DeleteUser.new({:username=>@user.username,:nickname=>@user.nickname,:email=>@user.email,:nation_num=>@user.nation_num,:mobile_num=>@user.mobile_num})

    @delete_user.transaction do
      @user.destroy
      @s_save=@delete_user.save!
    end

    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:title)
  end
end
