require_relative "../rails_helper"

describe "Feature Test: Message Show" do
  before(:each) do
    create_data # defined in boards_helper.rb
    visit login_path
    aspen_login
  end

  it "shows an individual message" do
    visit board_message_path(@message1)
    expect(current_path).to eq(board_message_path(@message1))
    expect(page).to have_content(@message1.content)
    expect(page).not_to have_content(@message2.content)
  end

  it "displays an edit link if the user created the message" do
    visit board_message_path(@message1)
    expect(page).to have_link("Edit Message", :href => edit_board_message_path(@message1))
  end

  it "does not display an edit link if the user did not create the message" do
    visit board_message_path(@message2)
    expect(page).not_to have_link("Edit Message")
  end
end
