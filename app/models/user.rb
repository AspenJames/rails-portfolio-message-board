class User < ApplicationRecord
  has_secure_password
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true

  has_many :messages
  has_many :boards, :through => :messages

  def created_boards
    @created = []
    @created << Board.where(:created_at => self.id)
  end

end
