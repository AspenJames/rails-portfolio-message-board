require_relative "../rails_helper"

describe "Feature Test: Dropdown Sort", :type => :feature do
  before(:each) do
    create_data # defined in boards_helper.rb
    visit login_path
    aspen_login # defined in login_helper.rb
    visit boards_path
  end

  it "renders a dropdown menu for sorting options" do
    expect(page).to have_css("select#sort")
  end

  it "sorts the boards alphabetically" do
    select("Alphabetical", :from => "sort")
    click_button("Sort!")
    expect(page).to have_css("article h3:nth-child(1)", :text => "Coffee Break")
    expect(page).to have_css("article h3:nth-child(2)", :text => "Lunchtime!")
  end
end
