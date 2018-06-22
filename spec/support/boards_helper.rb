module BoardsHelper

  def fill_board_form
    # ensure a user is logged in when using this method!
    fill_in("board[topic]", :with => "Happy Hour")
    click_button("Create Board")
  end

  def create_data
    # creates two users, two boards, and three messages
    @aspen = User.create(
      :name => "Aspen James",
      :username => "ajames",
      :email => "ajames@email.co",
      :password => "password"
    )
    @jdoe = User.create(
      :name => "John Doe",
      :username => "jdoe",
      :email => "jdoe@anon.com",
      :password => "password"
    )
    @lunch_board = Board.create(
      :topic => "Lunchtime!",
      :created_by => @aspen.id
    )
    @coffee_board = Board.create(
      :topic => "Coffee Break",
      :created_by => @jdoe.id
    )
    @message1 = Message.create(
      :content => "Message1 Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
      :user_id => @aspen.id,
      :board_id => @coffee_board.id
    )
    @message2 = Message.create(
      :content => "Message2 Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      :user_id => @jdoe.id,
      :board_id => @coffee_board.id
    )
    @message3 = Message.create(
      :content => "Message3 Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      :user_id => @aspen.id,
      :board_id => @coffee_board.id
    )
  end

end
