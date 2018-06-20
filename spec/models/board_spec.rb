require 'rails_helper'

RSpec.describe Board, type: :model do
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

  let(:message_one) {
    Message.create(
      :content => "First message",
      :board_id => board.id,
      :user_id => user.id
    )
  }

  let(:message_two) {
    Message.create(
      :content => "Second message",
      :board_id => board.id,
      :user_id => user.id
    )
  }

  it "is valid with a topic and created_by" do
    expect(board).to be_valid
  end

  it "is invalid without a topic" do
    expect(Board.new(:created_by => user.id)).not_to be_valid
  end

  it "is invalid without a created_by" do
    expect(Board.new(:topic => "Invalid Data Protections")).not_to be_valid
  end

  it "has many messages" do
    expect(board.messages).to include(message_one)
    expect(board.messages).to include(message_two)
  end

  it "has many users through messages" do
    user_two = User.create(
      :name => "John Doe",
      :username => "jdoe",
      :email => "jdoe@email.co",
      :password => "password"
    )
    message_three = Message.create(
      :content => "A wild message appears!",
      :user_id => user_two.id,
      :board_id => board.id
    )

    expect(board.users).to include(user)
    expect(board.users).to include(user_two)
  end

  it "has a method to return the creator of the board" do
    expect(board.creator).to eq(user)
  end

end
