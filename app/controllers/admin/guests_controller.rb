class Admin::GuestsController < Admin::AdminController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @sub_menu=t(:menu_guest)
    @controller_name=t('activerecord.models.guest')
  end

  # GET /guest
  # GET /guest.json
  def index
    @guests = Guest.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @guests }
    end
  end

  # GET /guest/1
  # GET /guest/1.json
  def show
  end

  # GET /guest/new
  # GET /guest/new.json
  def new
    @guest = Guest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @guest }
    end
  end

  # GET /guest/1/edit
  def edit
  end

  # POST /guest
  # POST /guest.json
  def create
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to admin_guest_path(@guest), :notice => @controller_name +t(:message_success_insert)  }
        format.json { render :json => @guest, :status => :created, :location => @guest }
      else
        format.html { render :action => "new" }
        format.json { render :json => @guest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /guest/1
  # PUT /guest/1.json
  def update
    respond_to do |format|
      if @guest.update_attributes(guest_params)
        format.html { redirect_to admin_guest_path(@guest), :notice =>@controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @guest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /guest/1
  # DELETE /guest/1.json
  def destroy
    @guest.destroy

    respond_to do |format|
      format.html { redirect_to admin_guests_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_guest
    @guest = Guest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def guest_params
    params.require(:guest).permit(:name,:email,:phone,:zip_code,:address_default,:address_detail,:enable)
  end
end
