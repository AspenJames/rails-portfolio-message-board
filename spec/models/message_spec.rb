require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user) {
    User.create(
      :name => "Aspen James",
      :username => "ajames",
      :email => "aspen@email.co",
      :password => "password"
    )
  }

  let(:board) {
    Board.create(
      :topic => "Coffee Break",
      :created_by => user.id
    )
  }

  let(:message) {
    Message.create(
      :content => "This is a valid message!",
      :user_id => user.id,
      :board_id => board.id
    )
  }

  it "is valid with content, user_id, and board_id" do
    expect(message).to be_valid
  end

  it "is not valid without a user_id" do
    expect(Message.new(:content => "This message is invalid", :board_id => board.id)).not_to be_valid
  end

  it "is not valid without a board_id" do
    expect(Message.new(:content => "This message is also invalid", :user_id => user.id)).not_to be_valid
  end

  it "is not valid without content" do
    expect(Message.new(:user_id => user.id, :board_id => board.id)).not_to be_valid
  end

  it "belongs to one User" do
    expect(message.user).to eq(user)
  end

  it "belongs to one Board" do
    expect(message.board).to eq(board)
  end

end
