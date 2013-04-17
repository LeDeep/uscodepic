class HelpRequest < ActiveRecord::Base
  attr_accessible :subject, :details

  belongs_to :user

  validates :subject, :presence => true
  validates :details, :presence => :true
  validates :user, :presence => :true
end
