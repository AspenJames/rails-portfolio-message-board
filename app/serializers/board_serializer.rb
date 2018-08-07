class BoardSerializer < ActiveModel::Serializer
  attributes :id, :topic
  has_many :messages, :serializer => MessageUserSerializer
end
