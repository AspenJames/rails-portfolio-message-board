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
    data["board"]["messages"].forEach(function(message){
      //build message data JSON
      let data = {
        "messageContent": message["content"],
        "boardID": id,
        "messageID": message["id"],
        "userID": message["user"]["id"],
        "username": message["user"]["username"]
      };
      //append to messagesDiv
      $("#messagesDiv")[0].innerHTML += template(data);
    });
  });
  // grab form submission event, prevent page reload
  $("#new_message").on("submit", function(event){
    event.preventDefault();
    $.post(`/boards/${id}/messages`, $(this).serialize(), function(response){
      // if an error message is received, response["message"] === undefined
      if (response["message"] === undefined) {
        $("p.error_message").text(response[0]);
        $("input[type='submit']")[0].disabled = false;
        $("textarea").focus();
      } else {
        //build message data JSON
        let data = {
          "messageContent": response["message"]["content"],
          "boardID": id,
          "messageID": response["message"]["id"],
          "userID": response["message"]["user"]["id"],
          "username": response["message"]["user"]["username"]
        };
        //append to messagesDiv
        $("#messagesDiv")[0].innerHTML += template(data);

        //clear form data, re-enable submit button, re-focus input field
        $("textarea").val("");
        $("input[type='submit']")[0].disabled = false;
        $("textarea").focus();
        // clear any error messages, if exists
        $("p.error_message").text("");
      };
    });
  });
});
