User.create(
  :name => "Aspen James",
  :username => "ajames",
  :email => "ajames@email.co",
  :password => "password"
)

User.create(
  :name => "Average Joe",
  :username => "avjoe",
  :email => "avjoe@email.co",
  :password => "password"
)

User.create(
  :username => "john_doe",
  :email => "jdoe@anon.gov",
  :password => "password"
)

Board.create(
  :topic => "Lunch Hour",
  :topic => "Best spots to get lunch around the office",
  :created_by => 2
)

Board.create(
  :topic => "Coffee Break",
  :created_by => 1
)

Board.create(
  :topic => "These are all break related",
  :description => "Does anyone do any work around here?",
  :created_by => 3
)

Message.create(
  :content => "Message one! Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  :user_id => 1,
  :board_id => 1
)

Message.create(
  :content => "Message two! Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  :user_id => 1,
  :board_id => 3,
)

Message.create(
  :content => "Message the third. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  :user_id => 2,
  :board_id => 1
)

Message.create(
  :content => "Message four, getting tedious. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  :user_id => 3,
  :board_id => 3
)

Message.create(
  :content => "Fifth message. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  :user_id => 2,
  :board_id => 2
)

Message.create(
  :content => "6. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  :user_id => 3,
  :board_id => 1
)
