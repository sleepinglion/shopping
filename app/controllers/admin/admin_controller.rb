class Admin::AdminController < ApplicationController
  before_action :authenticate_admin!,:only => [:index,:new,:create,:show,:edit, :update, :destroy]
  
  def initialize(*params)
    super(*params)
    
    @style='admin/application'
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_admin_session_path, :alert => exception.message
  end    
  
  def layout
    if(params[:no_layout])
      return false
    else
      return 'admin/application'
    end
  end  
  
 def index  
    
    @script='home/index'
  end  
end