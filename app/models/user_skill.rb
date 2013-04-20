class UserSkill < ActiveRecord::Base
  attr_accessible :skill

  validates :user, :presence => true
  validates :skill, :presence => true
  validates :user_id, :uniqueness => {:scope => :skill_id}

  belongs_to :user, :inverse_of => :user_skills
  belongs_to :skill, :inverse_of => :user_skills
end
