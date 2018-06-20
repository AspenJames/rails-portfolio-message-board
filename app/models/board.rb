class Board < ApplicationRecord
  has_many :messages
  has_many :users, :through => :messages
  validates :topic, :presence => true
  validates :created_by, :presence => true

  def creator
    @creator ||= User.find(self.created_by)
  end

end
