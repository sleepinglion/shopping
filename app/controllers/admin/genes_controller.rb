class Admin::GenesController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_gene, only: [:show, :edit, :update, :destroy]
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
        @genes = Gene.joins(:notice_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @genes = Gene.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      end
    else
      @genes = Gene.order('id desc').page(params[:page]).per(params[:per_page])
    end
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/new
  # GET /notices/new.json
  def new
    @gene = Gene.new
    @gene.build_notice_content

    @script='boards/new'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @gene }
    end
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @gene = Gene.new(notice_params)

    @script='boards/new'

    respond_to do |format|
      if @gene.save
        format.html { redirect_to admin_notice_path(@gene), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @gene, :status => :created, :location => @gene }
      else
        format.html { render :action => "new" }
        format.json { render :json => @gene.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @gene.update(notice_params)
        format.html { redirect_to admin_notice_path(@gene), :notice => @controller_name +t(:message_success_update)  }
        format.json { render :show, status: :ok, location: @gene }
      else
        format.html { render :edit }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @gene.destroy
    respond_to do |format|
      format.html { redirect_to admin_notices_path }
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
    params.require(:gene).permit(:title,:sub_title,:tip)
  end
end
