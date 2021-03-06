require 'spec_helper'

describe Skill do
  it {should allow_mass_assignment_of :name}
  it {should validate_presence_of :name}
  it {should have_many(:users).through(:user_skills)}
  it {should have_many :user_skills}
end
