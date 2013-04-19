require 'spec_helper'
require 'cancan/matchers'

describe User do
  context 'mass assignment' do
    it {should allow_mass_assignment_of :email}
    it {should allow_mass_assignment_of :password}
    it {should allow_mass_assignment_of :password_confirmation}
    it {should allow_mass_assignment_of :remember_me}
    it {should allow_mass_assignment_of :role}
    it {should allow_mass_assignment_of :skills}
  end
  
  context 'associations' do
    it {should have_many :help_requests}
    it {should have_one :profile}
    it {should have_many :responses}
    it {should have_many(:skills).through(:user_skills)}
    it {should have_many :user_skills}
  end

  context 'callbacks' do
    it 'creates a profile for the user after the user is created' do
      user = FactoryGirl.create(:user)
      user.profile.should_not be_nil
    end
  end

  context 'abilities' do
    subject {Ability.new(user)}

    context 'when signed in' do
      let(:user) {FactoryGirl.create(:user)}
      let(:other) {FactoryGirl.create(:user)}

      it {should be_able_to :read, HelpRequest.new}
      it {should be_able_to :create, user.help_requests.new}
      it {should_not be_able_to :create, other.help_requests.new}

      it {should be_able_to :read, Response.new}
      it {should be_able_to :create, user.responses.new}
    end

    context 'when not signed in' do
      let(:user) {User.new}
      
      it {should be_able_to :read, Response.new}
      it {should be_able_to :read, HelpRequest.new}
      it {should_not be_able_to :create, HelpRequest.new}
      it {should_not be_able_to :create, Response.new}
    end
  end

  context '#name' do
    it 'should return the email if the profile table does not exist' do
      user = FactoryGirl.create(:user)
      user.name.should eq user.email
    end
    it 'should return the first and last name from the profile table if it exists' do
      user = FactoryGirl.create(:user)
      user.profile.update_attributes(first_name: 'Bob', last_name: 'Smith')
      user.name.should eq 'Bob Smith'
    end
  end
end
