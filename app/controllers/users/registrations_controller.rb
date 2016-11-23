class Users::RegistrationsController < Devise::RegistrationsController
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_user)
    @sub_menu=t(:submenu_admin)
    @controller_name=t(:controller_admin)
  end
  
  # GET /admins
  # GET /admins.json
  def index   
    @users = User.where('parent_id is null').order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
      format.xls
    end
  end  
  
  def user_layout 
    if user_session
      "application"
    else     
      "login"
    end
  end
  
  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end