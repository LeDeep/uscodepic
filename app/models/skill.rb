class Skill < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  has_many :users, :through => :user_skills, :inverse_of => :skills
  has_many :user_skills
end
