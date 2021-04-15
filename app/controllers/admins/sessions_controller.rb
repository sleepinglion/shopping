class Admins::SessionsController < Devise::SessionsController
  layout 'admin/login'

  def create
    super

    #require 'ipaddr'
    #AdminLoginLog.create!(admin_id: current_admin.id,client_ip: IPAddr.new(request.remote_ip).to_i)
  end

  def after_sign_in_path_for(_resource)
    admin_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    if Rails.application.config.i18n.default_locale==I18n.locale
      new_admin_session_path()
    else
      new_admin_session_path(:locale=>I18n.locale)
    end
  end
end
