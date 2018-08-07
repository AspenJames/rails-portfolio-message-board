class BoardSerializer < ActiveModel::Serializer
  attributes :id, :topic, :description
  belongs_to :creator, :serializer => UserSerializer
  has_many :messages, :serializer => MessageUserSerializer
end
