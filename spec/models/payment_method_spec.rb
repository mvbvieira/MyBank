require 'rails_helper'

RSpec.describe PaymentMethod, type: :model do
  context 'user create a new payment_method' do
    it 'sucessfully' do
      user = create(:user)

      user.payment_methods.create(description: Faker::Lorem.words(number: 2))

      expect(user.payment_methods.count).to eq(1)
    end

    it 'code is set' do
      payment_method = create(:payment_method,
                              user: create(:user), description: 'Credit Card')

      expect(payment_method.code).to eq('credit_card')
    end

    context 'when has attributes blank' do
      it 'dont create a new payment_method' do
        user = create(:user)

        expect { user.payment_methods.create!(description: '') }.to raise_error(
          ActiveRecord::RecordInvalid
        )
      end
    end
  end
end
