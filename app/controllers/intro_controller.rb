class IntroController < ApplicationController
  def before_init
    super
    @page_itemtype = 'http://schema.org/AboutPage'
    @title =t(:menu_intro)
  end

  def index
    @intro=Intro.first
  end
end
