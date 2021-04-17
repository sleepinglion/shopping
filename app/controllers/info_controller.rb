class InfoController < ApplicationController
  def before_init
    super
    @page_itemtype = 'http://schema.org/AboutPage'
    @title = t(:info,scope:[:activerecord,:models])
  end

  def index

  end
end
