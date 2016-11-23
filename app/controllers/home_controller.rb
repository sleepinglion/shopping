class HomeController < ApplicationController
  before_filter :authenticate_user!, except: [ :index]  
  
  def index  
    
    @script='home/index'
  end
  
  def no_auth
  
  end
end