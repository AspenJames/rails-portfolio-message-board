class Board < ApplicationRecord
  has_many :messages
  has_many :users, :through => :messages
  validates :topic, :presence => true
  validates :created_by, :presence => true

  def creator
    @creator ||= User.find(self.created_by)
  end

  def self.sort_last_updated
    all.joins(:messages).order("messages.updated_at DESC").uniq
  end

  def self.sort_alphabetical
    order("boards.topic ASC")
  end

  def self.most_messages
    joins(:messages).group('boards.id').order('COUNT(messages.id) DESC').limit(1).first
  end

end
