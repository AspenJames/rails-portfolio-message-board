require_relative "../rails_helper"

describe "Feature Test: User Signup", :type => :feature do

  it "successfully signs up" do
    visit '/signup'
    # user_signup method is defined in login_helper.rb
    expect(current_path).to eq('/signup')
    user_signup
    expect(current_path).to eq(root_path) # FILL IN ROOT_PATH
  end

  it "on sign up, successfully adds a session hash" do
    visit '/signup'
    # user_signup method is defined in login_helper.rb
    user_signup
    expect(page.get_rack_session_key('user_id')).to_not be_nil
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
