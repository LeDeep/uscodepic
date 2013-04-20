class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :skills

  has_one :profile
  has_many :help_requests
  has_many :responses
  has_many :definitions
  has_many :words
  has_many :skills, :through => :user_skills, :inverse_of => :users
  has_many :user_skills
  has_many :votes

  after_create :make_profile

  def name
    if self.profile.first_name && self.profile.last_name
      self.profile.first_name + ' ' + self.profile.last_name
    else
      self.email
    end
  end

  def actions
    (self.help_requests.all + self.responses.all + self.user_skills.all).flatten.sort_by { |action| action.created_at }.reverse
  end

  def self.actions
    (HelpRequest.all + Response.all + UserSkill.all).flatten.sort_by { |action| action.created_at }.reverse
  end

  private

  def make_profile
    self.create_profile
  end
end
