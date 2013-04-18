class Subject < ActiveRecord::Base

  validates :name, :presence => true

  attr_accessible :name

  has_many :tools
  
end