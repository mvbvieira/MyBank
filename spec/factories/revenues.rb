FactoryBot.define do
  factory :revenue do
    user = create{ :user }

    description { Faker::Lorem.words(number: 2) }
    _type { Faker::Lorem.words(number: 1) }
    brand { Faker::Lorem.words(number: 1) }
    status { 1 }
    amount { '9.99' }
    received_at { Date.today }
    payment_method { create(:payment_method, user: user) }
    user { user }
  end
end
