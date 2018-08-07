$(function(){
  let id = $("#boardTopic").data("id");
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
  });
});
