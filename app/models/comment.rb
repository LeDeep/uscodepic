class Comment < ActiveRecord::Base
  validates :text, :story_id, :user_id, :presence => true
  attr_accessible :text, :story_id, :user_id

  belongs_to :story

end
