class FaqsController < ApplicationController
  before_action :set_faq, only: [:show]

  def before_init
    super
    @title = t(:menu_faq)
    @page_itemtype = 'http://schema.org/QAPage'
  end

  # GET /faqs
  # GET /faqs.json
  def index
    @faq_categories = FaqCategory.all

    if (params[:faq_category_id])
      @categoryId = params[:faq_category_id].to_i
    else
      if @faq_categories[0]
        @categoryId = @faq_categories[0].id.to_i
      else
        @categoryId = nil
      end
    end

    @faqs = Faq.where(:faq_category_id => @categoryId).order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: { :faqs => @faqs } }
    end
  end

  # GET /faqs/1
  # GET /faqs/1.json
  def show
    @faq_categories = FaqCategory.all

    if (params[:id])
      @faq = Faq.find(params[:id])
    end

    @title = @faq.title
    @meta_description = @faq.faq_content.content

    if (params[:faq_category_id])
      @categoryId = params[:faq_category_id].to_i
    else
      @categoryId = @faq.faq_category_id
    end

    @faqs = Faq.where(:faq_category_id => @categoryId).order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faq.faq_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_faq
    @faq = Faq.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def faq_params
    params.require(:faq).permit(:faq_category_id, :title, :display, :enable, faq_content_attributes: [:content])
  end
end
