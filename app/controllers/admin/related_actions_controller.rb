class Admin::RelatedActionsController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_related_action, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @category=t(:menu_gene)
    @sub_menu=t(:submenu_related_action)
    @controller_name=t('activerecord.models.related_action')
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
        @related_actions = RelatedAction.joins(:notice_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @related_actions = RelatedAction.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      end
    else
      @related_actions = RelatedAction.order('id desc').page(params[:page]).per(params[:per_page])
    end
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/new
  # GET /notices/new.json
  def new
    @related_action = RelatedAction.new
    @script='admin/new.js'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @related_action }
    end
  end

  # GET /notices/1/edit
  def edit
    @script='admin/new.js'    
  end

  # POST /notices
  # POST /notices.json
  def create
    @related_action = RelatedAction.new(related_action_params)
    @genes = Gene.find(params[:related_action][:gene_ids])
    
    respond_to do |format|
      if @related_action.save
        @related_action.genes=@genes
        
        format.html { redirect_to admin_related_action_path(@related_action), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @related_action, :status => :created, :location => @related_action }
      else
        format.html { render :related_action => "new" }
        format.json { render :json => @related_action.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    @genes = Gene.find(params[:related_action][:gene_ids])    
    
    respond_to do |format|
      if @related_action.update(related_action_params)
        @related_action.genes=@genes
        
        format.html { redirect_to admin_related_action_path(@related_action), :notice => @controller_name +t(:message_success_update)  }
        format.json { render :show, status: :ok, location: @related_action }
      else
        format.html { render :edit }
        format.json { render json: @related_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @related_action.destroy
    respond_to do |format|
      format.html { redirect_to admin_gene_categories_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between related_actions.
  def set_related_action
    @related_action = RelatedAction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def related_action_params
    params.require(:related_action).permit(:title,:sub_title,:tip,:enable)
  end
end
