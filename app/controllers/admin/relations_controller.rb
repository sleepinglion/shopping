class Admin::RelationsController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_relation, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @category=t(:menu_gene)
    @sub_menu=t(:submenu_relation)
    @controller_name=t('activerecord.models.relation')
  end

  # GET /relations
  # GET /relations.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10
    end

    if params[:search_type].present?
      if(params[:search_type]=='content')
        likesql='relation_contents.content like ?'
        likep = '%'+params[:search_value].strip+'%'
      elsif(params[:search_type]=='title')
        likesql='relations.title like ?'
        likep= '%'+params[:search_value].strip+'%'
      end
    end

    if(params[:search_type] && params[:search_value])
      if(params[:search_type]=='content')
        @relations = Relation.joins(:relation_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @relations = Relation.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      end
    else
      @relations = Relation.order('id desc').page(params[:page]).per(params[:per_page])
    end
  end

  # GET /relations/1
  # GET /relations/1.json
  def show
  end

  # GET /relations/new
  # GET /relations/new.json
  def new
    @relation = Relation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @relation }
    end
  end

  # GET /relations/1/edit
  def edit
  end

  # POST /relations
  # POST /relations.json
  def create
    @relation = Relation.new(relation_params)
    @genes = Gene.find(params[:relation][:gene_ids])    

    respond_to do |format|
      if @relation.save
        @relation.gene=@genes        
        format.html { redirect_to admin_relation_path(@relation), :relation => @controller_name +t(:message_success_insert)}
        format.json { render :json => @relation, :status => :created, :location => @relation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relations/1
  # PATCH/PUT /relations/1.json
  def update
    @genes = Gene.find(params[:relation][:gene_ids])
    
    respond_to do |format|
      @relation.gene=@genes
      
      if @relation.update(relation_params)
        format.html { redirect_to admin_relation_path(@relation), :relation => @controller_name +t(:message_success_update)  }
        format.json { render :show, status: :ok, location: @relation }
      else
        format.html { render :edit }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relations/1
  # DELETE /relations/1.json
  def destroy
    @relation.destroy
    respond_to do |format|
      format.html { redirect_to admin_relations_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_relation
    @relation = Relation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def relation_params
    params.require(:relation).permit(:gene_ids,:title,:enable)
  end
end
