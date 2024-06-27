FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.words(number: 10).join(' ') }
    temperature { Faker::Number.between(from: 195, to: 220) }
    brew_time { Faker::Number.between(from: 1, to: 10) }
  end
end