class NoticesController < ApplicationController
  impressionist
  
  def initialize(*params)
    super(*params)
    
    @category=t(:menu_board)
    @sub_menu=t(:submenu_notice)
    @controller_name=t('activerecord.models.notice')
  end  
  
  # GET /notices
  # GET /notices.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10        
    end
    
    if params[:format]=='xls'
      params[:page]=nil 
      params[:per_page]=50000  
    end
    
    if params[:search_field].present?   
      if(params[:search_field]=='content')
        likesql='notice_contents.content like ?'
        likep = '%'+params[:search_value].strip+'%'
      elsif(params[:search_field]=='title')
        likesql='notices.title like ?'
        likep= '%'+params[:search_value].strip+'%'
      end
    end
    
    if(params[:search_field] && params[:search_value])
      if(params[:search_field]=='content')
        @notices = Notice.joins(:notice_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @notices = Notice.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])      
      end
    else
      @notices = Notice.order('id desc').page(params[:page]).per(params[:per_page])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @notices }
    end
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
    @notice = Notice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @notice }
    end
  end

  # GET /notices/new
  # GET /notices/new.json
  def new
    @notice = Notice.new
    @notice.build_notice_content
    
    @script='boards/new'    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @notice }
    end
  end

  # GET /notices/1/edit
  def edit
    @notice = Notice.find(params[:id])
    
    @script='boards/new'    
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(params[:notice])
    
    @script='boards/new'    
    
    respond_to do |format|
      if @notice.save
        format.html { redirect_to @notice, :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @notice, :status => :created, :location => @notice }
      else
        format.html { render :action => "new" }
        format.json { render :json => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notices/1
  # PUT /notices/1.json
  def update
    @notice = Notice.find(params[:id])
    
    @script='boards/new'    

    respond_to do |format|
      if @notice.update_attributes(params[:notice])
        format.html { redirect_to @notice, :notice => @controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy

    respond_to do |format|
      format.html { redirect_to notices_url }
      format.json { head :no_content }
    end
  end
end