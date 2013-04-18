class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :bio
  belongs_to :user
end
