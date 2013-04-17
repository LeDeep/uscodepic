FactoryGirl.define do
  factory :help_request do
    subject 'stuck'
    details 'plz help'
    user
  end

  factory :user do
    sequence(:email) {|n| "email#{n}@bye.com"}
    password 'unbreakable'
    password_confirmation 'unbreakable'
  end
end