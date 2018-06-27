class BoardsController < ApplicationController
  before_action :require_login

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params(:topic, :created_by, :description))
    @board.messages.build(:content => params[:message][:content], :user_id => current_user.id) unless params[:message][:content].empty?
    if @board.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def index
    if params[:sort] == "Alphabetical"
      @boards = Board.sort_alphabetical
    elsif params[:sort] == "Recently Updated"
      @boards = Board.sort_last_updated
    else
      @boards = Board.all
    end
  end

  def show
    set_board
    @message = Message.new
  end

  def edit
    set_board
    check_user
  end

  def update
    set_board
    check_user
    @board.update(board_params(:topic, :description))
    redirect_to board_path(@board)
  end

  def delete
    set_board
    check_user
  end

  def destroy
    set_board
    check_user
    @board.messages.each do |m|
      m.destroy
    end
    @board.destroy
    flash[:notice] = "Board successfully deleted"
    redirect_to boards_path
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params(*args)
    params.require(:board).permit(*args)
  end

  def check_user
    if @board.creator != current_user
      flash[:alert] = "You are not authorized to edit or delete this board"
      redirect_to board_path(@board)
    end
  end

end
