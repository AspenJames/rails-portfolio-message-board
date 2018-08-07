class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :board_id
  belongs_to :user
end
