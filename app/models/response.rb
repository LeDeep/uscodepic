class Response < ActiveRecord::Base
  attr_accessible :message, :help_request

  belongs_to :user
  belongs_to :help_request

  validates :message, :presence => true
  validates :help_request, :presence => true
  validates :user, :presence => true
end
