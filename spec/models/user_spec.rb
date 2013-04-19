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
    it 'returns the email if the profile table does not exist' do
      user = FactoryGirl.create(:user)
      user.name.should eq user.email
    end
    it 'returns the first and last name from the profile table if it exists' do
      user = FactoryGirl.create(:user)
      user.profile.update_attributes(first_name: 'Bob', last_name: 'Smith')
      user.name.should eq 'Bob Smith'
    end
  end

  context '#actions' do
    it 'returns an array of all objects user has created' do
      help_request = FactoryGirl.create(:help_request)
      response = FactoryGirl.create(:response)
      user = FactoryGirl.create(:user, :help_requests => [help_request], :responses => [response])
      user.skills.create(:name => 'mad skillz')
      user_skill = user.user_skills.last
      user.actions.should eq [help_request, response, user_skill].sort_by { |action| action.created_at }.reverse
    end
  end

  context '.actions' do
    it 'returns an array of all objects created by any user' do
      help_request = FactoryGirl.create(:help_request)
      response = FactoryGirl.create(:response)
      skill = FactoryGirl.create(:skill)
      user = FactoryGirl.create(:user, :skills => [skill])
      user_skill = user.user_skills.last
      User.actions.should eq [user_skill, help_request, response, response.help_request].sort_by { |action| action.created_at }.reverse
    end
  end
end
