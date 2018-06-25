require_relative "../rails_helper"

describe "Feature Test: Message Show", :type => :feature do
  before(:each) do
    create_data # defined in boards_helper.rb
    visit login_path
    aspen_login # defined in login_helper.rb
  end

  it "shows an individual message" do
    visit board_message_path(@coffee_board, @message1)
    expect(current_path).to eq(board_message_path(@coffee_board, @message1))
    expect(page).to have_content(@message1.content)
    expect(page).not_to have_content(@message2.content)
  end

  it "displays an edit link if the user created the message" do
    visit board_message_path(@coffee_board, @message1)
    expect(page).to have_link("Edit Message", :href => edit_board_message_path(@coffee_board, @message1))
  end

  it "does not display an edit link if the user did not create the message" do
    visit board_message_path(@coffee_board, @message2)
    expect(page).not_to have_link("Edit Message")
  end
end

describe "Feature Test: Message Edit", :type => :feature do
  before(:each) do
    create_data # defined in boards_helper.rb
    visit login_path
    aspen_login # defined in login_helper.rb
  end

  it "redirects to the message show page with error message if the user did not create the message" do
    visit edit_board_message_path(@coffee_board, @message2)
    expect(current_path).to eq(board_message_path(@coffee_board, @message2))
    expect(page).to have_content("You are not authorized to edit this message")
  end

  it "renders an edit form if the user created the message" do
    visit edit_board_message_path(@coffee_board, @message1)
    expect(page).to have_field("message[content]", :text => @message1.content)
  end

  it "successfully updates the message with valid data" do
    visit edit_board_message_path(@coffee_board, @message1)
    fill_in("message[content]", :with => "Edited message Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
    click_button("Update Message")
    expect(current_path).to eq(board_message_path(@coffee_board, @message1))
    expect(page).to have_content("Edited message Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
  end

  it "does not update with invalid data" do
    visit edit_board_message_path(@coffee_board, @message1)
    fill_in("message[content]", :with => "   ")
    click_button("Update Message")
    expect(page).to have_content("Content can't be blank")
    expect(page).to have_css("div.field_with_errors")
  end
end

describe "Feature Test: Message delete", :type => :feature do
  before(:each) do
    create_data # defined in boards_helper.rb
    visit login_path
    aspen_login # defined in login_helper.rb
  end

  it "allows an authorized user to delete their own message" do
    visit board_message_path(@coffee_board, @message1)
    click_button("Delete Message")
    expect(current_path).to eq(board_path(@coffee_board))
    expect(page).not_to have_content(@message1.content)
  end

  it "does not allow a user to delete another's post" do
    visit board_message_path(@coffee_board, @message2)
    expect(page).not_to have_button("Delete Message")
  end
end
