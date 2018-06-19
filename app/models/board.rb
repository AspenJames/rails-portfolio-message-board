class Board < ApplicationRecord
  has_many :messages
  has_many :users, :through => :messages

  def creator
    @creator ||= User.find(self.created_by)
  end

end
