$(function(){
  // grab ID of current board requested
  let id = $("#boardTopic").data("id");

  // compile handlebars template for messages
  let template = Handlebars.compile($("#messageTemplate").html());

  // request JSON data for board
  $.getJSON(`/boards/${id}`, function(data){
    // assign creator name if exists, default to username
    let creator = data["board"]["creator"]["name"] || data["board"]["creator"]["username"];

    // update DOM elements
    $("#boardTopic").text(data["board"]["topic"]);
    $("#boardDescription").text(data["board"]["description"]);
    $("#boardCreator").text(creator);

    // These two elements only exist on the DOM if the current user is the
    // creator of the board.
    $("#editBoard").html(`<a href="/boards/${id}/edit">Edit Board</a>`)
    $("#deleteBoard").html(`<a href="/boards/${id}/delete">Delete Board</a>`)

    // iterate over messages array
    data["board"]["messages"].forEach(function(message_hash){
      let message = new Message(message_hash);
      appendMessage(message, template);
    });
  });


  // grab form submission event, prevent page reload
  $("#new_message").on("submit", function(event){
    event.preventDefault();
    $.post(`/boards/${id}/messages`, $(this).serialize(), function(response){

      // if an error message is received, response["message"] === undefined
      if (response["message"] === undefined) {
        $("p.error_message").text(response[0]);
        resetForm();

      } else {
        let message = new Message(response["message"]);
        appendMessage(message, template);

        resetForm();
        // clear any error messages, if exists
        $("p.error_message").text("");
      };
    });
  });
});

function Message(message_hash) {
  this.user = new User(message_hash["user"]);
  this.content = message_hash["content"];
  this.id = message_hash["id"];
  this.boardId = message_hash["board_id"];
};

Message.prototype.truncateContent = function(){
  if (this.content.length > 200) {
    return `${this.content.substring(0, 200)}...`;
  } else {
    return this.content;
  }
}

function User(user_hash) {
  this.id = user_hash["id"];
  this.username = user_hash["username"];
};

function appendMessage(message, template) {
  // build data JSON to pass to template
  let data = {
    "messageContent": message.truncateContent(),
    "boardID": message.boardId,
    "messageID": message.id,
    "userID": message.user.id,
    "username": message.user.username
  };
  //append to messagesDiv
  $("#messagesDiv")[0].innerHTML += template(data);
}

function resetForm() {
  $("textarea").val("");
  $("input[type='submit']")[0].disabled = false;
  $("textarea").focus();
}
