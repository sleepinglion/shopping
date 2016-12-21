class Admin::GenesRelatedActionsController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_genes_related_action, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @category=t(:menu_gene)
    @sub_menu=t(:submenu_genes_releated_action)
    @controller_name=t('activerecord.models.genes_related_action')
  end

  # GET /genes
  # GET /genes.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10
    end

    if params[:search_type].present?
      if(params[:search_type]=='content')
        likesql='gene_contents.content like ?'
        likep = '%'+params[:search_value].strip+'%'
      elsif(params[:search_type]=='title')
        likesql='genes.title like ?'
        likep= '%'+params[:search_value].strip+'%'
      end
    end

    if(params[:search_type] && params[:search_value])
      if(params[:search_type]=='content')
        @genes_related_actions = GenesRelatedAction.joins(:gene_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @genes_related_actions = GenesRelatedAction.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      end
    else
      if params[:related_action_id].present?
        @genes_related_actions = GenesRelatedAction.where(:related_action_id=>params[:related_action_id]).order('id desc').page(params[:page]).per(100)       
      else 
        @genes_related_actions = GenesRelatedAction.order('id desc').page(params[:page]).per(params[:per_page])
      end
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @genes_related_actions }
    end
  end

  # GET /genes/1
  # GET /genes/1.json
  def show
  end

  # GET /genes/new
  # GET /genes/new.json
  def new
    @genes_related_action = GenesRelatedAction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @genes_related_action }
    end
  end

  # GET /genes/1/edit
  def edit
  end

  # POST /genes
  # POST /genes.json
  def create
    @genes_related_action = GenesRelatedAction.new(genes_related_action_params)
   # @related_actions = RelatedAction.find(params[:genes_related_action][:related_action_ids])
   # @genes_related_action_relations = GeneRelation.find(params[:genes_related_action][:gene_relation_ids])   

    respond_to do |format|
      if @genes_related_action.save
    #    @genes_related_action.related_action=@related_actions
    #    @genes_related_action.gene_relation=@genes_related_action_relations  
        format.html { redirect_to admin_genes_related_action_path(@genes_related_action), :genes_related_action => @controller_name +t(:message_success_insert)}
        format.json { render :json => @genes_related_action, :status => :created, :location => @genes_related_action }
      else
        format.html { render :action => "new" }
        format.json { render :json => @genes_related_action.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genes/1
  # PATCH/PUT /genes/1.json
  def update
  #  @genes_related_action_categories = GeneCategory.find(params[:genes_related_action][:gene_category_ids])
  #  @genes_related_action_relations = GeneRelation.find(params[:genes_related_action][:gene_relation_ids])  
    
    respond_to do |format|
      if @genes_related_action.update(genes_related_action_params)
 #       @genes_related_action.gene_category=@genes_related_action_categories
 #       @genes_related_action.gene_relation=@genes_related_action_relations
                 
        format.html { redirect_to admin_genes_related_actions_path(@genes_related_action), :genes_related_action => @controller_name +t(:message_success_update)  }
        format.json { render :show, status: :ok, location: @genes_related_action }
      else
        format.html { render :edit }
        format.json { render json: @genes_related_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genes/1
  # DELETE /genes/1.json
  def destroy
    @genes_related_action.destroy
    respond_to do |format|
      format.html { redirect_to admin_genes_related_actions_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_genes_related_action
    @genes_related_action = GenesRelatedAction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def genes_related_action_params
    params.require(:genes_related_action).permit(:gene_id,:related_action_id,:position,:factor,:korean_rate,:paper,:enable)
  end
end
