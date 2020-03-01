class Expense < ApplicationRecord
  STATUS = %i[opened payed]

  belongs_to :payment_method
  belongs_to :user
end
