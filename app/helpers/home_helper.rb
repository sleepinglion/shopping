# encoding: utf-8

module HomeHelper
  def graph_width(all,cc)
    if(all==0)
      return 0
    end
    
    ((cc.to_f / all.to_f) * 700).to_i
  end
end