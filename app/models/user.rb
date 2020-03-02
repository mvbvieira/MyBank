class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[client admin]

  has_many :payment_methods, dependent: :destroy
  has_many :revenues, dependent: :destroy
  has_many :expenses, dependent: :destroy

  def account_balance
    revenues_sum - expense_sum
  end

  private

  def revenues_sum
    return revenues.sum(&:amount) if revenues.present?
    0.0
  end

  def expense_sum
    return expenses.sum(&:value) if expenses.present?
    0.0
  end
end
