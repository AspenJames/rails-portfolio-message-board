class MessagesController < ApplicationController

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
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content)
  end

  def set_board_and_message
    @board = Board.find(params[:board_id])
    @message = Message.find(params[:id])
  end

end
