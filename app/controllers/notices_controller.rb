class NoticesController < ApplicationController
  impressionist :actions => [:show]
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  # GET /notices
  # GET /notices.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    condition = {  enable: true }

    @notice_count = Notice.where(condition).count
    @notices = Notice.where(condition).page(params[:page]).per(params[:per_page]).order('id desc')
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/new
  def new
    @notice = Notice.new
    @notice.build_notice_content
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(notice_params)

    respond_to do |format|
      if @notice.save
        format.html { redirect_to @notice, notice: t(:message_success_create) }
        format.json { render action: 'show', status: :created, location: @notice }
      else
        format.html { render action: 'new' }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to @notice, notice: t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to notices_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notice
    @notice = Notice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def notice_params
    params.require(:notice).permit(:title, :enable, :display, notice_content_attributes: [:content]).merge(admin_id: current_admin.id)
  end
end
