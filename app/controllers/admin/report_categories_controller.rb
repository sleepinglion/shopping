class Admin::ReportCategoriesController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_report_category, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @category=t(:menu_report)
    @sub_menu=t(:submenu_report)
    @controller_name=t('activerecord.models.report_category')
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
        @report_categories = ReportCategory.joins(:notice_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @report_categories = ReportCategory.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      end
    else
      @report_categories = ReportCategory.order('id desc').page(params[:page]).per(params[:per_page])
    end
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/new
  # GET /notices/new.json
  def new
    @report_category = ReportCategory.new
    @script='admin/new.js'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @report_category }
    end
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @report_category = ReportCategory.new(report_category_params)

    @script='boards/new'

    respond_to do |format|
      if @report_category.save
        format.html { redirect_to admin_report_category_path(@report_category), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @report_category, :status => :created, :location => @report_category }
      else
        format.html { render :action => "new" }
        format.json { render :json => @report_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @report_category.update(report_category_params)
        format.html { redirect_to admin_report_category_path(@report_category), :notice => @controller_name +t(:message_success_update)  }
        format.json { render :show, status: :ok, location: @report_category }
      else
        format.html { render :edit }
        format.json { render json: @report_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @report_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_report_categories_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report_category
    @report_category = ReportCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_category_params
    params.require(:report_category).permit(:title,:sub_title,:color,:enable)
  end
end
