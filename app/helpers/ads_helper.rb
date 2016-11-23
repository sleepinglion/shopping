# encoding: utf-8

module AdsHelper
  def ad_show_link
    
  end
  
  def ad_list_link(body,url)
    params[:action]=nil
    params[:id]=nil
    
    link_to ads_path 
  end
end
