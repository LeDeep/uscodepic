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
  has_many :skills, :through => :user_skills, :inverse_of => :users
  has_many :user_skills

  after_create :make_profile

  private

  def make_profile
    self.create_profile
  end
end
