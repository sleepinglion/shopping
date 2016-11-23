# encoding: utf-8

module ApplicationHelper
  def list_param(lparam)
    lparam[:controller]=nil
    lparam[:action]=nil
    lparam[:id]=nil
    
    return lparam
  end
  
  def show_param(lparam)

    
    return lparam
  end  
  
  def flagToString(flag,no_html=false)
    if(no_html)
      if flag
        return t(:flag_true)
      else
        return t(:flag_false)
      end
    else
      if flag
        return '<span class="flag_true">'+t(:flag_true)+'</span>'
      else
        return '<span class="flag_false">'+t(:flag_false)+'</span>'
      end
    end
  end
  
  def sameOrderToString(same_order,no_html=false)
    if(no_html)
      if same_order
        return t(:same_order_true)
      else
        return t(:same_order_false)
      end
    else
      if same_order
        return '<span class="flag_true">'+t(:same_order_true)+'</span>'
      else
        return '<span class="flag_false">'+t(:same_order_false)+'</span>'
      end
    end
  end
  
  def link_to_home
    link_to('홈',root_path,:title=>'홈으로')
  end
  
  def actionNameChange(action_name)
    case action_name
    when 'index'
      return t(:action_index)
    when 'new'
      return t(:action_new)
    when 'edit'
      return t(:action_edit)
    when 'show'
      return t(:action_show)   
    else
    end
  end
  
  def current_controller(aa)
    if aa.include?(params[:controller])
      return 'class="current"'
    end
  end
  
  def manage_width(model)
    if can?(:delete, model) && can?(:update, model)
      return 'style="width:170px;"'
    else
      return 'style="width:90px"'
    end
  end
end
