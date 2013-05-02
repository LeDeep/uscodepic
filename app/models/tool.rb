class Tool < ActiveRecord::Base

  validates :name, :location, :subject_id, :type_id, :presence => true

  attr_accessible :name, :type_id, :subject_id, :location, :level, :cost, :goal

  belongs_to :type
  belongs_to :subject
  has_many :goals
  has_many :users, :through => :goals, :inverse_of => :tools

  LEVEL = ['Beginner', 'Intermediate', 'Advanced']

  COST = ["Free", "Subscription", "$0 - $20", "$21 - $50", "$51-$100", "Over $100"]
  
end