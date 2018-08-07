class MessageUserSerializer < ActiveModel::Serializer
  attributes :id, :content, :user
end
