class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[client admin]

  has_many :payment_methods, dependent: :destroy
  has_many :revenues, dependent: :destroy
  has_many :expenses, dependent: :destroy
end
