class Admin::FaqsController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_faq, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @category=t(:menu_board)
    @sub_menu=t(:submenu_faq)
    @controller_name=t('activerecord.models.faq')
  end

  # GET /faqs
  # GET /faqs.json
  def index
    unless params[:per_page].present?
      params[:per_page]=10
    end

    if params[:search_type].present?
      if(params[:search_type]=='content')
        likesql='faq_contents.content like ?'
        likep = '%'+params[:search_value].strip+'%'
      elsif(params[:search_type]=='title')
        likesql='faqs.title like ?'
        likep= '%'+params[:search_value].strip+'%'
      end
    end

    if(params[:search_type] && params[:search_value])
      if(params[:search_type]=='content')
        @faqs = Faq.joins(:faq_content).where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      else
        @faqs = Faq.where(likesql,likep).order('id desc').page(params[:page]).per(params[:per_page])
      end
    else
      @faqs = Faq.order('id desc').page(params[:page]).per(params[:per_page])
    end
  end

  # GET /faqs/1
  # GET /faqs/1.json
  def show
  end

  # GET /faqs/new
  # GET /faqs/new.json
  def new
    @faq = Faq.new
    @faq.build_faq_content

    @script='boards/new'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @faq }
    end
  end

  # GET /faqs/1/edit
  def edit
    @faq = Faq.find(params[:id])
    @script='boards/new'
  end

  # POST /faqs
  # POST /faqs.json
  def create
    @faq = Faq.new(faq_params)

    @script='boards/new'

    respond_to do |format|
      if @faq.save
        format.html { redirect_to admin_faq_path(@faq), :notice =>  @controller_name +t(:message_success_insert) }
        format.json { render :json => @faq, :status => :created, :location => @faq }
      else
        format.html { render :action => "new" }
        format.json { render :json => @faq.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faqs/1
  # PATCH/PUT /faqs/1.json
  def update
    respond_to do |format|
      if @faq.update(faq_params)
        format.html { redirect_to admin_faq_path(faq), :notice => @controller_name +t(:message_success_update)  }
        format.json { render :show, status: :ok, location: @faq }
      else
        format.html { render :edit }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1
  # DELETE /faqs/1.json
  def destroy
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to admin_faqs_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_faq
    @faq = Faq.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def faq_params
    params.require(:faq).permit(:title,:enable,:faq_content_attributes=>[:id,:content])
  end
end
