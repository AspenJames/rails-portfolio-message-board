require_relative "../rails_helper"

describe "Feature Test: Boards Index", :type => :feature do
  before(:each) do
    # create_data is defined in support/boards_helper.rb
    create_data
  end

  context "logged out" do
    it "redirects to root if not logged in" do
      visit boards_path
      expect(current_path).to eq(root_path)
    end
  end

  context "logged in" do
    before(:each) do
      # ensures there is a user logged in
      visit login_path
      user_login # defined in login_helper.rb
      visit boards_path
    end

    it "displays a list of boards" do
      expect(current_path).to eq(boards_path)
      expect(page).to have_content("Lunchtime!")
      expect(page).to have_content("Coffee Break")
    end

    it "displays the first two messages for a board" do
      expect(page).to have_content("Message1")
      expect(page).to have_content("Message2")
      expect(page).not_to have_content("Message3")
    end

    it "displays a link to view the full board" do
      expect(page).to have_link("View all...", :href => board_path(@lunch_board))
    end
  end

end

describe "Feature Test: Board Show", :type => :feature do
  before(:each) do
    # create_data is defined in support/boards_helper.rb
    create_data
  end

  context "logged out" do
    it "redirects to root if not logged in" do
      visit board_path(@lunch_board)
      expect(current_path).to eq(root_path)
    end
  end

  context "logged in" do
    before(:each) do
      visit login_path
      aspen_login #defined in login_helper.rb
    end

    it "displays the board's topic, creator, and messages" do
      visit board_path(@coffee_board)
      expect(current_path).to eq(board_path(@coffee_board))
      expect(page).to have_content(@coffee_board.topic)
      expect(page).to have_content(@coffee_board.messages.last.content)
      expect(page).to have_content(@coffee_board.creator.username)
    end

    it "displays an edit option if the current user is the board creator" do
      visit board_path(@lunch_board)
      expect(page).to have_link("Edit Board", :href => edit_board_path(@lunch_board))
    end

    it "does not display an edit option if the current user is not the board creator" do
      visit board_path(@coffee_board)
      expect(page).not_to have_content("Edit Board")
    end

    it "displays a form to submit a new message" do
      visit board_path(@coffee_board)
      expect(page).to have_field("message[content]")
    end

    it "submits a new message" do
      visit board_path(@lunch_board)
      fill_in("message[content]", :with => "New Message Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
      click_button("Post Message")
      expect(current_path).to eq(board_path(@lunch_board))
      expect(page).to have_content("New Message Lorem ipsum")
    end

    it "does not submit a blank message, displays an error message" do
      visit board_path(@lunch_board)
      click_button("Post Message")
      fill_in("message[content]", :with=> "    ")
      expect(page).to have_content("Content can't be blank")
    end
  end
end

describe "Feature Test: Board Edit", :type => :feature do
  before(:each) do
    create_data # defined in support/boards_helper.rb
    visit login_path
    aspen_login
  end

  it "renders an edit form for the board" do
    visit edit_board_path(@lunch_board)
    expect(current_path).to eq(edit_board_path(@lunch_board))
    expect(page).to have_field("board[topic]")
  end

  it "should update the board and render the show view" do
    visit edit_board_path(@lunch_board)
    fill_in("board[topic]", :with => "I'm Hungry")
    click_button("Update Board")
    expect(current_path).to eq(board_path(@lunch_board))
    expect(page).to have_content("I'm Hungry")
  end

end
