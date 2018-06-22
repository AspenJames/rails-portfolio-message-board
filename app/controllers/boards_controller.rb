class BoardsController < ApplicationController
  before_action :require_login

  def index
    @boards = Board.all
  end

  def show
    set_board
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

end
