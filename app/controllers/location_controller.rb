class LocationController < ApplicationController
  def before_init
    super
    @page_itemtype = 'http://schema.org/AboutPage'
    @title = t(:menu_location)
  end

  def index
    @location=Location.first
  end
end
