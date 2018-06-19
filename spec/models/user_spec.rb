require 'rails_helper'

RSpec.describe User, type: :model do
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

  let(:board_two) {
    Board.create(
      :topic => "Weekend Shenanigans",
      :created_by => user.id
    )
  }

  it "is valid with a name, username, email, and password" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(:username => "PwrdHater", :name => "John Doe", :email => "jdoe@hacked.co")).not_to be_valid
  end

  it "is not valid without a username" do
    expect(User.new(:name => "John Doe", :email => "jdoe@hacked.co", :password => "password")).not_to be_valid
  end

  it "is not valid without an email" do
    expect(User.new(:username => "PwrdHater", :name => "John Doe", :password => "password")).not_to be_valid
  end

  it "has many messages" do
    first_message = Message.create(:user_id => user.id, :board_id => board.id, :content => "This is the first message!")
    second_message = Message.create(:user_id => user.id, :board_id => board.id, :content => "This is the second message!")
    expect(user.messages.first).to eq(first_message)
    expect(user.messages.last).to eq(second_message)
  end

  it "has many boards through messages" do
    user.boards << [board, board_two]
    expect(user.boards.first).to eq(board)
    expect(user.boards.last).to eq(board_two)
  end

  it "has a method that returns boards the user created" do
    expect(user.created_boards).to include(board)
    expect(user.created_boards).to include(board_two)
  end

end
