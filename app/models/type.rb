class Type < ActiveRecord::Base

  validates :format, :presence => true

  attr_accessible :format

  has_many :tools
  
end