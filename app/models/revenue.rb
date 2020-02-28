class Revenue < ApplicationRecord
  STATUS = %i[pending payed]

  belongs_to :payment_method
  belongs_to :user

  validates :description, presence: true
end
