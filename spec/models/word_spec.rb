require 'spec_helper'

describe Word do
  context 'acessibility' do 
    it {should allow_mass_assignment_of :term}
  end

  context 'validations' do
    it {should validate_presence_of :term}
    it {should validate_presence_of :user}
  end

  context 'associations' do 
    it {should have_many :definitions}
    it {should belong_to :user}
  end

  context '#current_definition' do 
    it 'returns the most voted definition' do
      word = FactoryGirl.create(:word)
      definition2 = FactoryGirl.create(:definition, :word => word)
      definition1 = FactoryGirl.create(:definition, :word => word)
      FactoryGirl.create(:vote, :definition => definition2)
      word.current_definition.should eq definition2
    end
  end

  context '#definitions_in_order' do
    it 'returns the definitions for a word ordered by votes' do
      word = FactoryGirl.create(:word)
      current_definition = FactoryGirl.create(:definition, :word => word)
      unpopular_definition = FactoryGirl.create(:definition, :word => word)
      popular_definition = FactoryGirl.create(:definition, :word => word)
      2.times {FactoryGirl.create(:vote, :definition => current_definition)}
      1.times {FactoryGirl.create(:vote, :definition => popular_definition)}
      word.definitions_in_order.should eq [current_definition, popular_definition, unpopular_definition]
    end
  end
end
