require 'rails_helper'

RSpec.feature 'Revenues', type: :feature do
  scenario 'user already logged enter new revenue' do
    singin(create(:user))
    user = create(:user)

    visit root_path

    click_on 'Create Revenue'

    expect(current_path).to eq(new_revenue_path)
  end

  scenario 'user already logged create a new revenue' do
    user = create(:user)
    payment_method = create(:payment_method, user: user)
    singin(user)

    visit new_revenue_path

    fill_in 'Description', with: Faker::Lorem.sentence(word_count: 2)
    fill_in 'Type', with: Faker::Lorem.sentence(word_count: 1)
    fill_in 'Brand', with: Faker::Lorem.sentence(word_count: 1)
    fill_in 'Amount', with: Faker::Number.decimal(l_digits: 2)
    fill_in 'Received_at', with: Date.today
    select 'payed', from: :status

    click_on 'Create'

    expect(user.revenues.count).to eq(1)
  end
end

def singin(user)
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Log in'
end
