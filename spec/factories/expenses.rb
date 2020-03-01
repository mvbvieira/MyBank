FactoryBot.define do
  factory :expense do
    description { "MyString" }
    due_at { "2020-02-29" }
    status { 1 }
    value { "9.99" }
    payed_at { "2020-02-29" }
    payment_method { nil }
    user { nil }
  end
end
