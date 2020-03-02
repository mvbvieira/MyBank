require 'rails_helper'

RSpec.feature 'PaymentMethods', type: :feature do
  scenario 'user already logged enter new payment method' do
    singin(create(:user))

    visit root_path

    click_on 'New'
    click_on 'Payment Method'

    expect(current_path).to eq(new_payment_method_path)
  end

  scenario 'user already logged create a new payment method' do
    user = create(:user)
    singin(user)

    visit new_payment_method_path

    fill_in 'Description', with: 'Credit Card'
    click_on 'Create'

    expect(user.payment_methods.last.code).to eq('credit_card')
  end
end

def singin(user)
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Log in'
end
