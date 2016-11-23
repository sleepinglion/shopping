# encoding: utf-8

module QuizAnswersHelper
  def isCorrectToString(is_correct,no_html=false) 
    if(no_html)
      if is_correct
        return t(:is_correct_true)
      else
        return t(:is_correct_false)
      end
    else
      if is_correct
        return '<span class="flag_true">'+t(:is_correct_true)+'</span>'      
      else
        return '<span class="flag_false">'+t(:is_correct_false)+'</span>'
      end
    end
  end
end