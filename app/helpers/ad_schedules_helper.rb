# encoding: utf-8

module AdSchedulesHelper
  def list_param(lparam)
    lparam[:controller]=nil
    lparam[:action]=nil
    lparam[:id]=nil    
    lparam[:ad_id]=nil
    
    return lparam
  end
end
