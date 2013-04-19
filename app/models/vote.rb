class Vote < ActiveRecord::Base
  attr_accessible :up_down
  belongs_to :definition
  
  validates :up_down, :presence => true

end
