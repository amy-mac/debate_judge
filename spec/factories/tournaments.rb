require 'faker'

FactoryGirl.define do
  factory :tournament do
    tournament { Faker::Company.bs }
    school { Faker::Company.name }
    date '2012-10-23'

    factory :invalid_tournament do
      tournament nil
    end
  end
end
