FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "email#{n}@gmail.com"}
    password "gobbledygook1" 
    password_confirmation "gobbledygook1" 
  end

  factory :word do 
    sequence(:term) {|n| "sample#{n}"}
  end

  factory :definition do 
    sequence(:text) {|n| "Testing#{n}"}
    word
  end
end