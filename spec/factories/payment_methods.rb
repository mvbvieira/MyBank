FactoryBot.define do
  factory :payment_method do
    description { Faker::Lorem.sentence(word_count: 2) }
    user { nil }
  end
end
