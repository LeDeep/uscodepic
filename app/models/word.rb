class Word < ActiveRecord::Base
  attr_accessible :term
  validates :term, :user, :presence => :true
  has_many :definitions
  belongs_to :user

  def definitions_in_order
    definitions.sort_by {|definition| definition.votes.sum(&:up_down)}.reverse
  end

  def current_definition
    unless definitions.map(&:votes).flatten.empty?
      definitions.max_by {|definition| definition.votes.count}
    end
  end
end
