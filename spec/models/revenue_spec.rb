require 'rails_helper'

RSpec.describe Revenue, type: :model do
  context 'user create a new revenue' do
    it 'sucessfully' do
      user = create(:user)

      user.revenues.create(
        description: Faker::Lorem.words(number: 2),
        payment_method: create(:payment_method, user: user))

      expect(user.revenues.count).to eq(1)
    end

    context 'when has attributes blank' do
      it 'dont create a new revenue' do
        user = create(:user)

        expect { user.revenues.create!(description: '') }.to raise_error(
          ActiveRecord::RecordInvalid
        )
      end
    end
  end
end
