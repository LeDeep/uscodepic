require 'spec_helper'

describe Word do
  context 'acessibility' do 
    it {should allow_mass_assignment_of :term}

  end

  context 'validations' do
    it {should validate_presence_of :term}
  end

  context 'associations' do 
    it {should have_many :definitions}
  end
end
