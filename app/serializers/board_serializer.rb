class BoardSerializer < ActiveModel::Serializer
  attributes :id, :topic
<<<<<<< HEAD
  has_many :messages, :serializer => MessageUserSerializer
=======
  has_many :messages
>>>>>>> 7b7f61537fd7b8edb4f65fdec62c9194f131494b
end
