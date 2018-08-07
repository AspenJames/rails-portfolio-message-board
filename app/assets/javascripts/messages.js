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
