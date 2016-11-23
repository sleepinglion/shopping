# encoding: utf-8

module StatsHelper
  def get_color(num)
    case num
    when 0
      return '#00f'      
    when 1
      return '#c0f'
    when 2
      return '#cc0'      
    when 3
      return '#0c0'      
    when 4
      return '#0cf'      
    when 5
      return '#c30'     
    when 6
      return '#60f'
    when 7
      return '#933'
    when 8
      return '#ff9'
    when 9
      return '#330'      
    else
      return '#66c'
    end
  end
  
  
  def period_format(period)
    case period
    when 'month'
      return t(:month)
    when 'week'
      return t(:week)
    when 'date'
      return t(:day)
    end
  end
end
