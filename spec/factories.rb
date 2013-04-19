FactoryGirl.define do
  factory :profile do
    first_name 'Bob'
    last_name 'Smith'
    email 'bobsmith@yahoo.com'
    bio 'I want to be a programmer'
  end

  factory :skill do
    name 'really great skill'
  end

  factory :word do 
    sequence(:term) {|n| "sample#{n}"}
  end

  factory :definition do 
    sequence(:text) {|n| "Testing#{n}"}
    word
  end

  factory :help_request do
    subject 'stuck'
    details 'plz help'
    user
  end

  factory :response do
    message 'help is on the way'
    help_request
    user
  end

  factory :user do
    sequence(:email) { |n| "abc#{n}@gmail.com" }
    password "fooAAnnn$$54"
    password_confirmation 'fooAAnnn$$54'

    factory :user_with_skill do
      after(:create) do |user|
        FactoryGirl.create(:skill, :users => [user])
      end
    end
  end
end
