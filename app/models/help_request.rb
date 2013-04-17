class HelpRequest < ActiveRecord::Base
  attr_accessible :subject, :details

  belongs_to :user
  has_many :responses

  validates :subject, :presence => true
  validates :details, :presence => :true
  validates :user, :presence => :true
end
