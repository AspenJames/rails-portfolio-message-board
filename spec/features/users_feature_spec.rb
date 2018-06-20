require_relative "../rails_helper"

describe "Feature Test: User Signup", :type => :feature do

  it "successfully signs up" do
    visit '/signup' # CHANGE ROUTE FOR USERS/NEW
    expect(current_path).to eq('/signup')
    
  end

end
