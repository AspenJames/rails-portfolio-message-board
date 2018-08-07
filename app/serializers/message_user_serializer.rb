class MessageUserSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :board_id
end
