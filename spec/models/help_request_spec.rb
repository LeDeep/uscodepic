require 'spec_helper'

describe HelpRequest do
  context 'mass assignment' do
    it {should allow_mass_assignment_of :subject}
    it {should allow_mass_assignment_of :details}
  end

  context 'validations' do
    it {should validate_presence_of :subject}
    it {should validate_presence_of :details}
    it {should validate_presence_of :user}
  end

  context 'associations' do
    it {should belong_to :user}
  end
end
