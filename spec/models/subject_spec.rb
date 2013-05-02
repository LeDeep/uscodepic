require 'spec_helper'

describe Subject do 
  context 'validations' do
    it {should validate_presence_of :category} 
  end 

  context 'accessibility' do
    it {should allow_mass_assignment_of :category} 
  end

  context 'associations' do 
    it {should have_many :tools}
  end
end