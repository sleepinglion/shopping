class Admin::NoticesController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_notice, only: [:show, :edit, :update, :destroy]
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

    if params[:search_type].present?
      if(params[:search_type]=='content')
        likesql='notice_contents.content like ?'
        likep = '%'+params[:search_value].strip+'%'
      elsif(params[:search_type]=='title')
        likesql='notices.title like ?'
        likep= '%'+params[:search_value].strip+'%'
      end
    end

    if(params[:search_type] && params[:search_value])
      if(params[:search_type]=='content')
        @notices = Notice.joins(:notice_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @notices = Notice.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      end
    else
      @notices = Notice.order('id desc').page(params[:page]).per(params[:per_page])
    end
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
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
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(notice_params)

    @script='boards/new'

    respond_to do |format|
      if @notice.save
        format.html { redirect_to admin_notice_path(@notice), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @notice, :status => :created, :location => @notice }
      else
        format.html { render :action => "new" }
        format.json { render :json => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to admin_notice_path(@notice), :notice => @controller_name +t(:message_success_update)  }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render :edit }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to admin_notices_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notice
    @notice = Notice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def notice_params
    params.require(:notice).permit(:title,:enable,:notice_content_attributes=>[:id,:content])
  end
end
