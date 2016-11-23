class FaqsController < ApplicationController
  impressionist  
  before_filter :authenticate_user!, except: [ :index, :show ]
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_board)
    @sub_menu=t(:submenu_faq)    
    @controller_name=t('activerecord.models.faq')
  end
  
  # GET /faqs
  # GET /faqs.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10        
    end
    
    if params[:search_field].present?   
      if(params[:search_field]=='content')
        likesql='faq_contents.content like ?'
        likep = '%'+params[:search_value].strip+'%'
      elsif(params[:search_field]=='title')
        likesql='faqs.title like ?'
        likep= '%'+params[:search_value].strip+'%'
      end
    end
    
    if(params[:search_field] && params[:search_value])
      if(params[:search_field]=='content')
        @faqs = Faq.joins(:faq_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @faqs = Faq.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])      
      end
    else
      @faqs = Faq.order('id desc').page(params[:page]).per(params[:per_page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @faqs }
    end
  end

  # GET /faqs/1
  # GET /faqs/1.json
  def show
    @faq = Faq.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @faq }
    end
  end

  # GET /faqs/new
  # GET /faqs/new.json
  def new
    @faq = Faq.new
    @faq.build_faq_content
    
    @script='boards/new' 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @faq }
    end
  end

  # GET /faqs/1/edit
  def edit
    @faq = Faq.find(params[:id])
    @script='boards/new'
  end

  # POST /faqs
  # POST /faqs.json
  def create
    @faq = Faq.new(params[:faq])
    
    @script='boards/new'    
    
    respond_to do |format|
      if @faq.save
        format.html { redirect_to @faq, :notice =>  @controller_name +t(:message_success_insert) }
        format.json { render :json => @faq, :status => :created, :location => @faq }
      else
        format.html { render :action => "new" }
        format.json { render :json => @faq.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /faqs/1
  # PUT /faqs/1.json
  def update
    @faq = Faq.find(params[:id])
    @script='boards/new'    

    respond_to do |format|
      if @faq.update_attributes(params[:faq])
        format.html { redirect_to @faq, :notice => @controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @faq.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1
  # DELETE /faqs/1.json
  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy

    respond_to do |format|
      format.html { redirect_to faqs_url }
      format.json { head :no_content }
    end
  end
end