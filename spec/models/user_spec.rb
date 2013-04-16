require 'spec_helper'

describe User do
  context 'mass assignment' do
    it {should allow_mass_assignemnt_of(:email)}
    it {should allow_mass_assignemnt_of(:password)}
    it {should allow_mass_assignemnt_of(:password_confirmation)}
    it {should allow_mass_assignemnt_of(:remember_me)}
    it {should allow_mass_assignemnt_of(:role)}
  end
end
