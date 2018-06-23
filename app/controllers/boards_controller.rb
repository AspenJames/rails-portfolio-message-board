class BoardsController < ApplicationController
  before_action :require_login

  def index
    @boards = Board.all
  end

  def show
    set_board
    @message = Message.new
  end

  def edit
    set_board
  end

  def update
    set_board
    @board.update(board_params(:topic))
    redirect_to board_path(@board)
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params(*args)
    params.require(:board).permit(*args)
  end

end
