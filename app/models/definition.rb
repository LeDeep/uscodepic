class Definition < ActiveRecord::Base
  attr_accessible :word_id, :user_id, :text, :current

  validates :word, :text, :user, :presence => :true

  belongs_to :word
  belongs_to :user
  has_many :votes

  after_create :add_vote

  private

  def add_vote
    user.votes.create(:definition => self, :up_down => 1)
  end
end
