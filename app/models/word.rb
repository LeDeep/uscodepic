class Word < ActiveRecord::Base
  attr_accessible :term
  validates :term, :presence => :true
  has_many :definitions

  def current_definition
    self.definitions.order("created_at").last.text if self.definitions.count > 0
  end
end
