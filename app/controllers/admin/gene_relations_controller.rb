class Admin::GeneRelationsController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_gene_relation, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @category=t(:menu_gene)
    @sub_menu=t(:submenu_gene_relation)
    @controller_name=t('activerecord.models.gene_relation')
  end

  # GET /gene_relations
  # GET /gene_relations.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10
    end

    if params[:search_type].present?
      if(params[:search_type]=='content')
        likesql='gene_relation_contents.content like ?'
        likep = '%'+params[:search_value].strip+'%'
      elsif(params[:search_type]=='title')
        likesql='gene_relations.title like ?'
        likep= '%'+params[:search_value].strip+'%'
      end
    end

    if(params[:search_type] && params[:search_value])
      if(params[:search_type]=='content')
        @gene_relations = GeneRelation.joins(:gene_relation_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @gene_relations = GeneRelation.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      end
    else
      @gene_relations = GeneRelation.order('id desc').page(params[:page]).per(params[:per_page])
    end
  end

  # GET /gene_relations/1
  # GET /gene_relations/1.json
  def show
  end

  # GET /gene_relations/new
  # GET /gene_relations/new.json
  def new
    @gene_relation = GeneRelation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @gene_relation }
    end
  end

  # GET /gene_relations/1/edit
  def edit
  end

  # POST /gene_relations
  # POST /gene_relations.json
  def create
    @gene_relation = GeneRelation.new(gene_relation_params)
    @genes = Gene.find(params[:gene_relation][:gene_ids])    

    respond_to do |format|
      if @gene_relation.save
        @gene_relation.gene=@genes        
        format.html { redirect_to admin_gene_relation_path(@gene_relation), :gene_relation => @controller_name +t(:message_success_insert)}
        format.json { render :json => @gene_relation, :status => :created, :location => @gene_relation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @gene_relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gene_relations/1
  # PATCH/PUT /gene_relations/1.json
  def update
    @genes = Gene.find(params[:gene_relation][:gene_ids])
    
    respond_to do |format|
      @gene_relation.gene=@genes
      
      if @gene_relation.update(gene_relation_params)
        format.html { redirect_to admin_gene_relation_path(@gene_relation), :gene_relation => @controller_name +t(:message_success_update)  }
        format.json { render :show, status: :ok, location: @gene_relation }
      else
        format.html { render :edit }
        format.json { render json: @gene_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gene_relations/1
  # DELETE /gene_relations/1.json
  def destroy
    @gene_relation.destroy
    respond_to do |format|
      format.html { redirect_to admin_gene_relations_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gene_relation
    @gene_relation = GeneRelation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def gene_relation_params
    params.require(:gene_relation).permit(:gene_ids,:title,:enable)
  end
end
