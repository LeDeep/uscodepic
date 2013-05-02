require 'spec_helper'

describe Goal do
  context 'mass assignment' do
    it {should allow_mass_assignment_of :status}
    it {should allow_mass_assignment_of :user_id}
    it {should allow_mass_assignment_of :tool_id}
  end

  context 'associations' do
    it {should belong_to :tool}
    it {should belong_to :user}
  end

  context 'validations' do
    it {should validate_presence_of :status}
    it {should validate_presence_of :user_id}
    it {should validate_presence_of :tool_id}
  end
end