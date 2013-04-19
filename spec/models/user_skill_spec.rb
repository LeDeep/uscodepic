require 'spec_helper'

describe UserSkill do
  it {should allow_mass_assignment_of :skill}

  context 'validations' do
    it {should validate_presence_of :user}
    it {should validate_presence_of :skill}
    it {should validate_uniqueness_of(:user_id).scoped_to(:skill_id) }
  end

  context 'associations' do
    it {should belong_to :user}
    it {should belong_to :skill}
  end
end
