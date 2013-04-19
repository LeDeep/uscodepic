require 'spec_helper'

describe Definition do
  context 'acessibility' do 
    it {should allow_mass_assignment_of :text}   
    it {should allow_mass_assignment_of :user_id}
    it {should allow_mass_assignment_of :word_id}
  end

  context 'validations' do
    it {should validate_presence_of :text}
    it {should validate_presence_of :user}
    it {should validate_presence_of :word}
  end

  context 'associations' do
    it {should belong_to :word}
    it {should have_many :votes}
  end

  #fixme - we should use this approach instead of Word#definitions_in_order. let's get better at sql :)
  # it 'orders by the most voted definition' do
  #   less_voted_definition = FactoryGirl.create(:definition)
  #   more_voted_definition = FactoryGirl.create(:definition)
  #   Definition.all.should eq [more_voted_definition, less_voted_definition]
  # end
end
