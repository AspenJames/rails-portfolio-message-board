require_relative "../rails_helper"

describe "Feature Test: Boards Index", :type => :feature do
  before(:each) do
    # create_data is defined in boards_helper.rb
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
    # create_data is defined in boards_helper.rb
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
      expect(page).to have_content(@coffee(_board.topic)
      expect(page).to have_content(@coffee_board.messages.last.content)
      expect(page).to have_content(@coffee_board.created_by.username)
    end

    it "displays an edit option if the current user is the board creator" do
      vist board_path(@lunch_board)
      expect(page).to have_link("Edit Board", :href => edit_board_path(@lunch_board))
    end

    it "does not display an edit option if the current user is not the board creator" do
      visit board_path(@coffee_board)
      expect(page).not_to have_content("Edit Board")
    end
  end
end

describe "Feature Test: Board Edit", :type => :feature do

end
