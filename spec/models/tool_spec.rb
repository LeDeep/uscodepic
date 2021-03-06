require 'spec_helper'

describe Tool do 
  context 'validations' do
    it {should validate_presence_of :name} 
    it {should validate_presence_of :location} 

  end 

  context 'accessibility' do
    it {should allow_mass_assignment_of :name} 
    it {should allow_mass_assignment_of :location} 
    it {should allow_mass_assignment_of :type_id} 
    it {should allow_mass_assignment_of :subject_id} 
    it {should allow_mass_assignment_of :level} 
    it {should allow_mass_assignment_of :cost} 
    it {should allow_mass_assignment_of :goal} 
  end

  context 'associations' do 
    it {should belong_to :type}
    it {should belong_to :subject}
    it {should have_many :goals}
    it {should have_many(:users).through(:goals)}
  end
end