FactoryGirl.define do

  # factory :user do
  #   sequence(:email) {|n| "email#{n}@gmail.com"}
  #   password "gobbledygook1" 
  #   password_confirmation "gobbledygook1" 
  # end

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
    closed false
    user
  end

  factory :response do
    message 'help is on the way'
    help_request
    user
  end

  factory :user do
    sequence(:email) {|n| "email#{n}@bye.com"}
    password 'unbreakable'
    password_confirmation 'unbreakable'
  end

  factory :story do
    title 'Really great article'
    url 'http://www.canyoubelievethis.com/so/cool/'
  end
end
