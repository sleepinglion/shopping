class Admin::AdminController < ApplicationController
  before_action :authenticate_admin!,:only => [:index,:new,:create,:show,:edit, :update, :destroy]
  
  def initialize(*params)
    super(*params)
    
    @style='admin/application'
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