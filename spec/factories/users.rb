require 'faker'

FactoryGirl.define do
  factory :user do
    password "foobar00"
    password_confirmation "foobar00"
    email { Faker::Internet.email }
    name { Faker::Name.name }
  
    factory :invalid_user do
      email nil
    end
  end
end