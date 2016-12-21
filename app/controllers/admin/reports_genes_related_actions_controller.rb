class Admin::ReportsGenesRelatedActionsController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_reports_genes_releated_action, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @category=t(:menu_report)
    @sub_menu=t(:submenu_reports_genes_related_action)
    @controller_name=t('activerecord.models.reports_genes_releated_action')
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
        @reports_genes_relatd_actions = ReportsGenesRelatedAction.joins(:report_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @reports_genes_relatd_actions = ReportsGenesRelatedAction.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      end
    else
      @reports_genes_relatd_actions = ReportsGenesRelatedAction.order('id desc').page(params[:page]).per(params[:per_page])
    end
  end
  
  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @reports_genes_relatd_action = ReportsGenesRelatedAction.new
    
    @script='admin/reports_genes_releated_actions/new.js'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @reports_genes_relatd_action }
    end
  end

  # GET /reports/1/edit
  def edit
    @script='admin/reports_genes_releated_actions/new.js'    
  end

  # POST /reports
  # POST /reports.json
  def create
      if params[:report_file]
        require 'CSV'
        
        uploaded_io=params[:report_file]
        
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end
        
        
        arr_of_arrs = CSV.read(Rails.root.join('public', 'uploads',uploaded_io.original_filename), :encoding => 'iso-8859-1:utf-8')
                  
        related_action_id=0
        arr_of_arrs.each_with_index do |row,index|
          next unless row[0]
          if row[0].include? "#"
            related_action_id=related_action_id+1;
            next
          end
          
          puts related_action_id          
          puts 'gene_name';
          puts row[0]
          gene=Gene.select(:id).where(:enable=>true,:title=>row[0]).first
          unless gene
            puts 'not find title : '+row[0]
            next
          end
          
          genes_related_action=GenesRelatedAction.select(:id,:related_action_id).where(:gene_id=>gene.id,:position=>row[1],:related_action_id=>related_action_id,:enable=>true).first
          unless genes_related_action
            puts 'not find title : '+row[0]
            next
          end
          
          report=Report.select(:id).where(:user_id=>params[:user_id],:related_action_id=>genes_related_action.related_action_id,:enable=>true).first
          next unless report  
          
          report_genes_related_action = ReportsGenesRelatedAction.new do |r|
            r.report_id = report.id
            r.genes_related_action_id = genes_related_action.id    
            r.genotype = row[3]
            r.enable = true;
          end
          
          report_genes_related_action.save!
        end
        save_result=true;
      else
        @reports_genes_relatd_action = ReportsGenesRelatedAction.new(reports_genes_related_actions_params)      
        save_result=@reports_genes_relatd_action.save
      end
      
    respond_to do |format|            
        if save_result
          format.html { redirect_to admin_reports_genes_related_actions_path, :report => @controller_name +t(:message_success_insert)}
          format.json { render :json => @reports_genes_relatd_action, :status => :created, :location => @reports_genes_relatd_action }
        else
          format.html { render :action => "new" }
          format.json { render :json => @reports_genes_relatd_action.errors, :status => :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @reports_genes_relatd_action.update(reports_genes_related_actions_params)
        format.html { redirect_to admin_reports_genes_releated_action_path(@reports_genes_relatd_action), :report => @controller_name +t(:message_success_update)  }
        format.json { render :show, status: :ok, location: @reports_genes_relatd_action }
      else
        format.html { render :edit }
        format.json { render json: @reports_genes_relatd_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @reports_genes_relatd_action.destroy
    respond_to do |format|
      format.html { redirect_to admin_reports_genes_related_actions_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reports_genes_releated_action
    @reports_genes_relatd_action = ReportsGenesRelatedAction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reports_genes_related_actions_params
    params.require(:reports_genes_releated_action).permit(:report_id,:genes_related_action_id,:genotype,:enable)
  end
end
