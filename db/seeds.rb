User.create(
  #id:1
  :name => "Aspen James",
  :username => "ajames",
  :email => "ajames@email.co",
  :password => "password"
)

User.create(
  #id:2
  :name => "Average Joe",
  :username => "avjoe",
  :email => "avjoe@email.co",
  :password => "password"
)

User.create(
  #id:3
  :username => "john_doe",
  :email => "jdoe@anon.gov",
  :password => "password"
)

User.create(
  #id:4
  :username => "guest",
  :email => "guest@example.com",
  :password => "demo"
)

Board.create(
  #id:1
  :topic => "Lunch Hour",
  :description => "Best spots to get lunch around the office",
  :created_by => 2
)

Board.create(
  #id:2
  :topic => "Coffee Break",
  :created_by => 1
)

Board.create(
  #id:3
  :topic => "Switch to Linux",
  :description => "Advice and help on switching your workstation to a Linux OS",
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

Message.create(
  :content => "Guest example message Maecenas varius dui nunc, vel molestie ipsum efficitur pretium. Nullam vestibulum, mi non mollis porta, dui felis convallis nisi, a lacinia metus turpis at eros. Etiam nec velit dictum metus porta vehicula. Sed vel fermentum mi, ut vestibulum eros. Nam porta nulla nibh, ut lacinia erat venenatis quis. Integer condimentum rhoncus arcu eget auctor. Donec nec ultricies nunc. In egestas elit at libero faucibus pretium.",
  :user_id => 4,
  :board_id => 3
)

Message.create(
  :content => "Guest example message Pellentesque aliquam dapibus odio id ultrices. Praesent efficitur ante et maximus lobortis. Pellentesque molestie eros leo, eu volutpat magna rhoncus quis. Aliquam vestibulum lorem fringilla posuere ornare. Integer fringilla eget diam sed eleifend. Etiam mollis, ex a convallis condimentum, leo orci posuere magna, vel aliquam nunc massa malesuada turpis. Vestibulum at condimentum ipsum. Nullam ultricies est et neque mollis tincidunt. Vestibulum accumsan lobortis tortor non vestibulum. Suspendisse condimentum gravida lacus nec consectetur. Vivamus tempor nisi in leo ullamcorper porta.",
  :user_id => 4,
  :board_id => 1
)