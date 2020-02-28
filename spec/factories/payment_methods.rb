FactoryBot.define do
  factory :payment_method do
    description { Faker::Lorem.words(number: 2) }
    user { nil }
  end
end
