require 'spec_helper'

describe Definition do
  context 'acessibility' do 
    it {should allow_mass_assignment_of :text}   
    it {should allow_mass_assignment_of :user_id}
    it {should allow_mass_assignment_of :word_id}

  end

  context 'validations' do
    it {should validate_presence_of :text}
    # it {should validate_presence_of :user_id}
    it {should validate_presence_of :word_id}
  end

  context 'associations' do
    it {should belong_to :word}
  end
  
end
