# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :contention do
    speech_type 'Aff1'
    contention {Faker::Company.bs}
  end
end
