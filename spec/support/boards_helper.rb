module BoardsHelper

  def fill_board_form
    # call user_signup from login_helper.rb to log in ajames
    fill_in("board[topic]", :with => "Happy Hour")
    click_button("Create Board")
  end

  def create_data
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
  end

end
