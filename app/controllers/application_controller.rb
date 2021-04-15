class ApplicationController < ActionController::Base
  layout :layout
  before_action :set_locale
  before_action :set_og_title

  def initialize(*params)
    super(*params)
    before_init
  end

  def before_init
    @meta_robot = 'all, index, follow'
    @meta_description = t(:meta_description)
    @meta_keywords = t(:meta_keywords)
    @meta_image = t(:site_full_url)

    @page_itemtype = "http://schema.org/WebPage"
  end

  def set_og_title
    if @title
      @og_title = @title
    else
      @og_title = t(:default_title)
    end
  end

  def current_ability
    @current_ability ||= UserAbility.new(current_user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :notice => t(:login_first)
  end

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  #  def default_url_options(options={})
  #    18n={ locale: I18n.locale }
  #
  #    return i18n
  #  end

  def layout
    if params[:no_layout]
      return false
    else
      return 'application'
    end
  end
end
