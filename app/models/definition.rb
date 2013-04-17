class Definition < ActiveRecord::Base
  attr_accessible :word_id, :user_id, :text
  validates :word_id, :text,  :presence => :true
  belongs_to :word

end