require_relative "../rails_helper"

describe "Feature Test: Root", :type => :feature do
  context "logged out" do
    it "displays a welcome message with links to log in/sign up" do
      visit root_path
      expect(page).to have_content("Welcome, please sign up or log in.")
      expect(page).to have_link("Sign Up", :href => signup_path)
      expect(page).to have_link("Log In", :href => login_path)
    end
  end

  context "logged in" do
    before(:each) do
      visit signup_path
      user_signup # defined in login_helper.rb
    end

    it "it welcomes the user by name/username" do
      expect(page).to have_content("Welcome Aspen James!")
      click_button("Log Out")
      visit signup_path
      user_2_signup
      expect(page).to have_content("Welcome k_law!")
    end

    it "has links for boards#index, new board, log out" do
      expect(page).to have_link("Boards", :href => boards_path)
      expect(page).to have_link("New Board", :href => new_board_path)
      expect(page).to have_link("Log Out", :href => logout_path)
    end
  end
end
