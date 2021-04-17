class Admin::BoardsController < Admin::AdminController
  before_action :set_Board, only: [:show, :edit, :update, :destroy]

  # GET /Boards
  # GET /Boards.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    @board_count = Board.count
    @boards = Board.page(params[:page]).per(params[:per_page]).order('id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boards }
    end
  end

  # GET /Boards/1
  # GET /Boards/1.json
  def show
  end

  # GET /Boards/new
  def new
    @board = Board.new
    @board.build_board_content
  end

  # GET /Boards/1/edit
  def edit
  end

  # POST /Boards
  # POST /Boards.json
  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id

    respond_to do |format|
      if @board.save
        format.html { redirect_to [:admin, @board], notice: t(:message_success_create) }
        format.json { render action: 'show', status: :created, location: @board }
      else
        format.html { render action: 'new' }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Boards/1
  # PATCH/PUT /Boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to [:admin, @board], notice: t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Boards/1
  # DELETE /Boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to admin_boards_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def board_params
    params.require(:board).permit(:id, :title, :enable, board_content_attributes: [:content])
  end
end
