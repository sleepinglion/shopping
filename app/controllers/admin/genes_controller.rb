class Admin::GenesController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_gene, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @category=t(:menu_gene)
    @sub_menu=t(:submenu_gene)
    @controller_name=t('activerecord.models.gene')
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
        @genes = Gene.joins(:gene_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @genes = Gene.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      end
    else
      @genes = Gene.order('id desc').page(params[:page]).per(params[:per_page])
    end
  end

  # GET /genes/1
  # GET /genes/1.json
  def show
  end

  # GET /genes/new
  # GET /genes/new.json
  def new
    @gene = Gene.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @gene }
    end
  end

  # GET /genes/1/edit
  def edit
  end

  # POST /genes
  # POST /genes.json
  def create
    @gene = Gene.new(gene_params)
    @gene_categories = GeneCategory.find(params[:gene][:gene_category_ids]);
    @gene_relations = GeneRelation.find(params[:gene][:gene_category_ids]);     

    respond_to do |format|
      if @gene.save
        @gene.gene_category=@gene_categories
        @gene.gene_relation=@gene_relations  
        format.html { redirect_to admin_gene_path(@gene), :gene => @controller_name +t(:message_success_insert)}
        format.json { render :json => @gene, :status => :created, :location => @gene }
      else
        format.html { render :action => "new" }
        format.json { render :json => @gene.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genes/1
  # PATCH/PUT /genes/1.json
  def update
    @gene_categories = GeneCategory.find(params[:gene][:gene_category_ids]);
    @gene_relations = GeneRelation.find(params[:gene][:gene_category_ids]);    
    
    respond_to do |format|
      if @gene.update(gene_params)
        @gene.gene_category=@gene_categories
        @gene.gene_relation=@gene_relations
                 
        format.html { redirect_to admin_gene_path(@gene), :gene => @controller_name +t(:message_success_update)  }
        format.json { render :show, status: :ok, location: @gene }
      else
        format.html { render :edit }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genes/1
  # DELETE /genes/1.json
  def destroy
    @gene.destroy
    respond_to do |format|
      format.html { redirect_to admin_genes_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gene
    @gene = Gene.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def gene_params
    params.require(:gene).permit(:title,:sub_title,:gene_category_ids,:gene_relation_ids,:description,:enable)
  end
end
