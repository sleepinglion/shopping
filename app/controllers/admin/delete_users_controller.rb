class Admin::DeleteUsersController < Admin::AdminController
  impressionist
  load_and_authorize_resource
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_user)
    @sub_menu=t(:submenu_deleted_user)
    @controller_name=t(:controller_deleted_user)
  end 
 
  # GET /users
  # GET /users.json
  def index
    @delete_users = DeleteUser.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @delete_users }
      format.xls    
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
   @delete_user = DeleteUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>@delete_user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new  
   @delete_user = DeleteUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>@delete_user }
    end
  end

  # GET /users/1/edit
  def edit
   @delete_user = DeleteUser.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
   @user=User.find(params[:user_id])
   @delete_user=DeleteUser.new({:username=>@user.username,:nickname=>@user.nickname,:email=>@user.email,:nation_num=>@user.nation_num,:mobile_num=>@user.mobile_num})
    
    @delete_user.transaction do
      @user.destroy
      @s_save=@delete_user.save!
    end

    respond_to do |format|
      if @s_save
        format.html { redirect_to admin_delete_user_path(@delete_user), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json =>@delete_user, :status => :created, :location =>@delete_user }
      else
        format.html { render :action => "new" }
        format.json { render :json =>@delete_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
   @delete_user = DeleteUser.find(params[:id])

    respond_to do |format|
      if @delete_user.update_attributes(params[:delete_user])
        format.html { redirect_to admin_delete_user_path(@delete_user), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json =>@delete_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
   @delete_user = DeleteUser.find(params[:id])
   @delete_user.destroy

    respond_to do |format|
      format.html { redirect_to admin_delete_users_path }
      format.json { head :no_content }
    end
  end
end