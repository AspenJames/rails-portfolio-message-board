require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {
    User.create(
      :name => "Aspen James"
      :username => "ajames"
      :email => "aspen@email.co"
      :password => "password"
    )
  }

  it "is valid with a name, username, email, and password" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(:username => "PwrdHater", :name => "John Doe", :email => "jdoe@hacked.co")).not_to be_valid
  end

  it "is not valid without a username" do
    expect(User.new(:name => "John Doe", :email => "jdoe@hacked.co", :password => "password")).not_to be_valid
  end

  it "is not valid without an email" do
    expect(User.new(:username => "PwrdHater", :name => "John Doe", :password => "password")).not_to be_valid
  end

end
