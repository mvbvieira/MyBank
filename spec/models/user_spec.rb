require 'rails_helper'

RSpec.describe User, type: :model do
  context '#role' do
    it 'when create role default is client' do
      user = create(:user)

      expect(user.role).to eq('client')
    end

    it 'when a role is 1 return admin' do
      user = create(:user, role: 1)

      expect(user.role).to eq('admin')
    end
  end

  context 'when a user is created' do
    it 'with successfully' do
      user = create(:user)

      expect(user.valid?).to be_truthy
    end

    it 'with blank attributes, dont create' do
      expect { create(:user, email: '') }.to raise_error(
        ActiveRecord::RecordInvalid, "Validation failed: Email can't be blank"
      )
    end
  end
end
