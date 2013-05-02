class Subject < ActiveRecord::Base

  validates :category, :presence => true

  attr_accessible :category

  has_many :tools
  
end