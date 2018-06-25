require_relative "../rails_helper"

describe "Feature Test: User Signup", :type => :feature do

  it "successfully signs up" do
    visit '/signup'
    expect(current_path).to eq('/signup')
    # user_signup method is defined in login_helper.rb
    user_signup
    expect(current_path).to eq(root_path)
  end

  it "on sign up, successfully adds a session hash" do
    visit '/signup'
    # user_signup method is defined in login_helper.rb
    user_signup
    # get_rack_session_key method is provided by rack_session_access gem
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it "re-renders the signup page without logging in if no username is given" do
    visit '/signup'
    user_signup_no_username
    expect(current_path).to eq('/signup')
    expect(page.get_rack_session.has_key?('user_id')).to_not be true
  end

  it "re-renders the signup page without logging in if no password is given" do
    visit '/signup'
    user_signup_no_password
    expect(current_path).to eq('/signup')
    expect(page.get_rack_session.has_key?('user_id')).to_not be true
  end

  it "displays error messages when form is submitted improperly" do
    visit '/signup'
    user_signup_no_password
    # Message below to account for how the HTML is returned by Capybara
    expect(page.body).to include("Password can&#39;t be blank")
  end

  it "successfully logs in a user" do
    # create_user and user_login are defined in login_helper.rb
    create_user
    visit '/login'
    expect(page.current_path).to eq('/login')
    user_login
    expect(current_path).to eq(root_path)
  end

  it "on login, successfully adds a session hash" do
    # create_user and user_login are defined in login_helper.rb
    create_user
    visit '/login'
    user_login
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it "does not log a user in with improper credentials" do
    create_user
    visit '/login'
    user_wrong_password
    expect(page.get_rack_session.has_key?('user_id')).to_not be true
  end

  it "re-renders the login form with an error message" do
    create_user
    visit '/login'
    user_wrong_password
    expect(current_path).to eq('/login')
    expect(page.body).to include("Incorrect username and/or password")
  end

end

describe "Feature Test: User Signout", :type => :feature do

  it "has a link ot log out from the root path" do
    visit '/signup'
    #user_signup is defined in login_helper.rb
    user_signup
    expect(page).to have_content("Log Out")
  end

  it "redirects to root after logging out" do
    visit '/signup'
    #user_signup is defined in login_helper.rb
    user_signup
    click_link("Log Out")
    expect(current_path).to eq(root_path)
  end

  it "clears the session hash when 'Log Out' is clicked" do
    visit '/signup'
    #user_signup is defined in login_helper.rb
    user_signup
    click_link("Log Out")
    expect(page.get_rack_session.has_key?('user_id')).to_not be true
  end

end

describe "Feature Test: User Show", :type => :feature do

  before(:each) do
    # helper methods are defined in login_helper.rb
    visit '/signup'
    user_signup
    click_link("Log Out")
    visit '/signup'
    user_2_signup
    click_link("Log Out")
  end

  it "redirects to root if not signed in" do
    visit '/users/1'
    expect(current_path).to eq(root_path)
  end

  it "shows the user's profile if they are logged in" do
    visit '/login'
    aspen_login
    click_link("Profile")
    expect(current_path).to eq(user_path(1))
    expect(page).to have_content("Aspen James")
  end

  it "shows the user's username if the user's name is nil" do
    visit '/login'
    k_law_login
    click_link("Profile")
    expect(current_path).to eq(user_path(2))
    expect(page).to have_content("k_law")
  end

  it "shows a link to edit the user's profile" do
    visit '/login'
    aspen_login
    click_link("Profile")
    expect(page).to have_link("Edit Profile", :href => edit_user_path(1))
  end

  it "shows a link to delete the user's profile" do
    visit '/login'
    aspen_login
    click_link("Profile")
    expect(page).to have_link("Delete Profile", :href => delete_user_path(1))
  end
end

describe "Feature Test: User Edit", :type => :feature do
  before(:each) do
    visit signup_path
    user_signup #defined in login_helper.rb
    click_link("Profile")
    click_link("Edit Profile")
  end

  it "renders an edit form" do
    expect(current_path).to eq(edit_user_path(1))
    expect(page).to have_css("form")
  end

  it "updates a user's profile with valid parameters" do
    fill_in("user[name]", :with => "Someone Else")
    fill_in("user[password]", :with => "password")
    click_button("Update Profile")
    expect(current_path).to eq(user_path(1))
    expect(page).to have_content("Someone Else")
    expect(page).not_to have_content("Aspen James")
    expect(User.find(1).name).to eq("Someone Else")
  end

  it "re-renders the form with error messages with invalid parameters" do
    fill_in("user[username]", :with => "   ")
    fill_in("user[password]", :with => "password")
    click_button("Update Profile")
    expect(page).to have_content("Username can't be blank")
    expect(page).to have_css("div.field_with_errors")
  end

  it "does not update the user with invalid parameters" do
    fill_in("user[username]", :with => "   ")
    fill_in("user[password]", :with => "password")
    click_button("Update Profile")
    expect(User.find(1).username).to eq("ajames")
  end

  it "does not update with an incorrect password" do
    fill_in("user[name]", :with => "Someone Else")
    fill_in("user[password]", :with => "not_password")
    click_button("Update Profile")
    expect(page).to have_content("Incorrect password")
    expect(current_path).to eq(edit_user_path(1))  
  end

end

describe "Feature Test: User Delete", :type => :feature do
  before(:each) do
    visit signup_path
    user_signup # defined in login_helper.rb
    click_link("Profile")
  end

  it "renders a confirmation page before deletion" do
    click_link("Delete Profile")
    expect(current_path).to eq(delete_user_path(1))
    expect(page).to have_content("Deleting your profile will delete all boards and messages you have created. This cannot be undone.")
    expect(page).to have_button("Confirm Deletion")
  end

  it "allows a user to delete their profile and clears the sessions hash" do
    click_link("Delete Profile")
    click_button("Confirm Deletion")
    expect(current_path).to eq(root_path)
    expect(page.get_rack_session.has_key?('user_id')).to_not be true
  end
end
