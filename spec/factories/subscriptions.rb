FactoryBot.define do
  factory :subscription do
    association :tea
    association :customer
    title { Faker::Lorem.words(number: 3).join(' ') }  
    price { Faker::Number.between(from: 10, to: 100) }
    status { 0 }
    frequency { Faker::Number.between(from: 1, to: 12) }
  end
end