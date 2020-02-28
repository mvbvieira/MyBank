class PaymentMethod < ApplicationRecord
  belongs_to :user

  has_many :revenues, dependent: :destroy

  validates :description, presence: true

  before_create :set_code

  private

  def set_code
    self.code = description.downcase.tr(' ', '_')
  end
end
