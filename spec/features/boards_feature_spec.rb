require_relative "../rails_helper"

describe "Feature Test: Boards Index", :type => :feature do
  before(:each) do # this initiates data and logs a user in
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
      expect(page).to have_link("View All...", :href => board_path(@lunch_board))
    end
  end

end

describe "Feature Test: Board Show", :type => :feature do

end

describe "Feature Test: Board Edit", :type => :feature do

end
