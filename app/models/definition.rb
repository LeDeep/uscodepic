class Definition < ActiveRecord::Base
  attr_accessible :word_id, :user_id, :text, :current

  validates :word, :text, :user, :presence => :true

  belongs_to :word
  belongs_to :user
  has_many :votes
end
