require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'user create a new expense' do
    it 'sucessfully' do
      user = create(:user)

      user.expenses.create(
        description: Faker::Lorem.words(number: 2),
        payment_method: create(:payment_method, user: user))

      expect(user.expenses.count).to eq(1)
    end

    context 'when has attributes blank' do
      it 'dont create a new expense' do
        user = create(:user)

        expect { user.expenses.create!(description: '') }.to raise_error(
          ActiveRecord::RecordInvalid
        )
      end
    end
  end
end
