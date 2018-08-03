class MessagesController < ApplicationController
  before_action :require_login

  def create
    @board = Board.find(params[:board_id])
    @message = @board.messages.build(message_params)
      if @board.save
        redirect_to board_path(@board)
      else
        render 'boards/show'
      end
  end

  def show
    set_board_and_message
  end

  def edit
    set_board_and_message
    check_user
  end

  def update
    set_board_and_message
    check_user
    if @message.update(message_params)
      redirect_to board_message_path(@board, @message)
    else
      render :edit
    end
  end

  def destroy
    set_board_and_message
    @message.destroy
    flash[:notice] = "Message successfully deleted"
    redirect_to board_path(@board)
  end

  def index
    render :json => Message.all
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content)
  end

  def set_board_and_message
    @board = Board.find(params[:board_id])
    @message = Message.find(params[:id])
  end

  def check_user
    if current_user != @message.user
      flash[:alert] = "You are not authorized to edit this message"
      redirect_to board_message_path(@board, @message)
    end
  end

end
