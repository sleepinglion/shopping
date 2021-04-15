class HomeController < ApplicationController

  def index
    @slider = Slider.where(:enable => true)
    @product_categories = ProductCategory.where(:enable => true)
    @notices = Notice.where(:enable => true).limit(5)
    @boards = Board.where(:enable => true).limit(5)
    @script = 'home/index'
  end

  def no_auth

  end

  def feed
    @notices = Notice.all.where(:enable => true)
    @boards = Board.all.where(:enable => true)
    @faqs = Faq.all.where(:enable => true)
    @products = Product.where(:enable => true)
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
end