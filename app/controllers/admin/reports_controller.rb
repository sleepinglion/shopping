class Admin::ReportsController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @category=t(:menu_report)
    @sub_menu=t(:submenu_report)
    @controller_name=t('activerecord.models.report')
  end

  # GET /reports
  # GET /reports.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10
    end

    if params[:search_type].present?
      if(params[:search_type]=='content')
        likesql='report_contents.content like ?'
        likep = '%'+params[:search_value].strip+'%'
      elsif(params[:search_type]=='title')
        likesql='reports.title like ?'
        likep= '%'+params[:search_value].strip+'%'
      end
    end

    if(params[:search_type] && params[:search_value])
      if(params[:search_type]=='content')
        @reports = Report.joins(:report_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @reports = Report.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      end
    else
      @reports = Report.order('id desc').page(params[:page]).per(params[:per_page])
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @report = Report.new

    @script='boards/new'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @report }
    end
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    @script='boards/new'

    respond_to do |format|
      if @report.save
        format.html { redirect_to admin_report_path(@report), :report => @controller_name +t(:message_success_insert)}
        format.json { render :json => @report, :status => :created, :location => @report }
      else
        format.html { render :action => "new" }
        format.json { render :json => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to admin_report_path(@report), :report => @controller_name +t(:message_success_update)  }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to admin_reports_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:title,:report_category_id,:gene_category_id)
  end
end
