require 'spec_helper'

describe Type do 
  context 'validations' do
    it {should validate_presence_of :name} 
  end 

  context 'accessibility' do
    it {should allow_mass_assignment_of :name} 

  end

  context 'associations' do 
    it {should have_many :tools}
  end
end