class Admin::GeneCategoriesController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_gene_category, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @category=t(:menu_gene)
    @sub_menu=t(:submenu_gene_category)
    @controller_name=t('activerecord.models.gene_category')
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
        @gene_categories = GeneCategory.joins(:notice_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @gene_categories = GeneCategory.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      end
    else
      @gene_categories = GeneCategory.order('id desc').page(params[:page]).per(params[:per_page])
    end
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/new
  # GET /notices/new.json
  def new
    @gene_category = GeneCategory.new
    @script='admin/new.js'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @gene_category }
    end
  end

  # GET /notices/1/edit
  def edit
    @script='admin/new.js'    
  end

  # POST /notices
  # POST /notices.json
  def create
    @gene_category = GeneCategory.new(gene_category_params)

    respond_to do |format|
      if @gene_category.save
        format.html { redirect_to admin_gene_category_path(@gene_category), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @gene_category, :status => :created, :location => @gene_category }
      else
        format.html { render :action => "new" }
        format.json { render :json => @gene_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @gene_category.update(gene_category_params)
        format.html { redirect_to admin_gene_category_path(@gene_category), :notice => @controller_name +t(:message_success_update)  }
        format.json { render :show, status: :ok, location: @gene_category }
      else
        format.html { render :edit }
        format.json { render json: @gene_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @gene_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_gene_categories_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gene_category
    @gene_category = GeneCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def gene_category_params
    params.require(:gene_category).permit(:title,:sub_title,:tip,:enable)
  end
end
