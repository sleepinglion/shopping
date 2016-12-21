class ApplicationController < ActionController::Base 
  protect_from_forgery with: :exception
  layout :layout
  before_action :set_locale
  
  def initialize(*params)
    super(*params)
    
    @style='application'
    @script='application'
  end
  
  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)        
  end
  
  def set_locale
     I18n.locale = 'ko'
     I18n.locale = params[:locale] || I18n.default_locale
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end  
  
  def layout
    if(params[:no_layout])
      return nil
    else
      return 'application'
    end
  end
end
