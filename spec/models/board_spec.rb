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

end
