class Admin::LocationController < Admin::AdminController
  before_action :set_location, only: [:edit, :update]

  # GET /location
  # GET /location.json
  def index
    @location = Location.first
  end

  # GET /locations/1/edit
  def edit; end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to admin_location_index_path(@location), notice: t(:message_success_update) }
        format.json { render :show, status: :ok, location: admin_location_index_path(@location) }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_location
    @location = Location.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def location_params
    params.require(:location).permit(:title, :description, :address, :lat, :lng, :marker_lat, :marker_lng, :enable)
  end
end
