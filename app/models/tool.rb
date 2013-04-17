class Tool < ActiveRecord::Base

  validates :name, :type_id, :subject_id, :location, :presence => true

  attr_accessible :name, :type_id, :subject_id, :location, :level, :cost

  belongs_to :type
  belongs_to :subject
  
end