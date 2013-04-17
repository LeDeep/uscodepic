require 'spec_helper'

describe Response do
  context 'mass assignment' do
    it {should allow_mass_assignment_of :message}
    it {should allow_mass_assignment_of :help_request}
  end

  context 'associations' do
    it {should belong_to :help_request}
    it {should belong_to :user}
  end

  context 'validations' do
    it {should validate_presence_of :user}
    it {should validate_presence_of :message}
    it {should validate_presence_of :help_request}
  end
end
