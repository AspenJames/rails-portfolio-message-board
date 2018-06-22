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

  private

  def message_params
    params.require(:message).permit(:user_id, :content)
  end

end
