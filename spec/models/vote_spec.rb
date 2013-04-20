require 'spec_helper'

describe Vote do

  context 'associations' do 
    it {should belong_to :definition}
    it {should belong_to :user}
  end

  context 'validations' do 
    it {should validate_presence_of :up_down}
    it {should allow_mass_assignment_of :up_down}
    it {should validate_presence_of :user}
  end

  context 'accessibility' do
    it {should allow_mass_assignment_of :definition}
  end
end
