$(function(){
  //clear boards div
  $("#boards").text("");
  // compile handlebars template for boards
  let template = Handlebars.compile($("#boardTemplate").html());
  // compile handlebars template for messages
  let messageTemplate = Handlebars.compile($("#messageTemplate").html());

  //request JSON data for boards
  $.getJSON(`/boards`, function(data){
    appendBoards(data, template, messageTemplate);
  });

  $("form").on("submit", function(event){
    event.preventDefault();
    $.getJSON(`/boards`, $(this).serialize(), function(data){
      //clear the boards div
      $("#boards").text("");
      appendBoards(data, template, messageTemplate);
      // re-enable submit button
      $("input[type='submit']")[0].disabled = false;
    });
  });

});

function Board(board_hash) {
  this.id = board_hash["id"];
  this.topic = board_hash["topic"];
  this.messages = [];
  this.creator = new User(board_hash["creator"]);
  board_hash["messages"].forEach(function(message){
    this.messages.push(new Message(message));
  }.bind(this));
}

function appendBoards(data, template, messageTemplate) {
  data["boards"].forEach(function(board_hash){
    //build JSON to insert
    let board = new Board(board_hash);
    let board_data = {
      "topic": board.topic,
      "id": board.id
    };
    //append to boards div
    $("#boards")[0].innerHTML += template(board_data);

    //insert first two messages into message div
    //if less than two messages, only insert if message exists
    let max = board.messages.length >= 2 ? 2 : board.messages.length;
    for (let i=0; i<max; i++){
      let message_data = {
        "user_id": board.messages[i].user.id,
        "username": board.messages[i].user.username,
        "content": board.messages[i].truncateContent()
      };
      $(`#${board.id}-messages`)[0].innerHTML += messageTemplate(message_data);
    };
  });
}
