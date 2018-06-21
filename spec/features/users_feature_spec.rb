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

end
