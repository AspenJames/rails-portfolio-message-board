class Message < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :content, :presence => true

  def time_posted
    self.created_at.strftime("%A, %b %e %Y, %l:%m %p")
  end

  def time_updated
    self.updated_at.strftime("%A, %b %e %Y, %l:%m %p")
  end
end
