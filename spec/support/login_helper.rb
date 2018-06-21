module LoginHelper

  def user_signup
    fill_in("user[name]", :with => "Aspen James")
    fill_in("user[username]", :with => "ajames")
    fill_in("user[email]", :with => "aspen@email.co")
    fill_in("user[password]", :with => "password")
    click_button('Sign Up')
  end

  def aspen_login
    fill_in("user[username]", :with => "ajames")
    fill_in("user[password]", :with => "password")
    click_button("Log In")
  end

  def user_2_signup
    fill_in("user[username]", :with => "k_law")
    fill_in("user[email]", :with => "k_law@email.co")
    fill_in("user[password]", :with => "password")
    click_button('Sign Up')
  end

  def k_law_login
    fill_in("user[username]", :with => "k_law")
    fill_in("user[password]", :with => "password")
    click_button("Log In")
  end

  def user_signup_no_username
    fill_in("user[name]", :with => "Aspen James")
    fill_in("user[email]", :with => "aspen@email.co")
    fill_in("user[password]", :with => "password")
    click_button('Sign Up')
  end

  def user_signup_no_password
    fill_in("user[name]", :with => "Aspen James")
    fill_in("user[username]", :with => "ajames")
    fill_in("user[email]", :with => "aspen@email.co")
    click_button('Sign Up')
  end

  def create_user
    @jdoe = User.create(
      :name => "John Doe",
      :username => "jdoe",
      :email => "jdoe@anon.com",
      :password => "password"
    )
  end

  def user_login
    fill_in("user[username]", :with => "jdoe")
    fill_in("user[password]", :with => "password")
    click_button("Log In")
  end

  def user_wrong_password
    fill_in("user[username]", :with => "jdoe")
    fill_in("user[password]", :with => "wrong_pass")
    click_button("Log In")
  end

end
