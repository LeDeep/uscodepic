class Goal < ActiveRecord::Base

  validates :status, :user_id, :tool_id, :presence => true

  attr_accessible :status, :user_id, :tool_id

  belongs_to :tool
  belongs_to :user

  STATUS = ["Queue", "In Progress", "Completed"]

end