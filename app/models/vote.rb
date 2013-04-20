class Vote < ActiveRecord::Base
  attr_accessible :up_down, :definition
  belongs_to :definition
  belongs_to :user
  
  validates :up_down, :presence => true
  validates :user, :presence => true
end
