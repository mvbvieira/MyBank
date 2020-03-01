require 'rails_helper'

RSpec.feature "Expenses", type: :feature do
  scenario 'user already logged enter new expense' do
    singin(create(:user))
    user = create(:user)

    visit root_path

    click_on 'Create Expense'

    expect(current_path).to eq(new_expense_path)
  end

  scenario 'user already logged create a new expense' do
    user = create(:user)
    payment_method = create(:payment_method, user: user)
    singin(user)

    visit new_expense_path

    fill_in 'Description', with: Faker::Lorem.sentence(word_count: 2)
    fill_in 'Value', with: Faker::Number.decimal(l_digits: 2)
    fill_in 'Due_at', with: Date.today
    select 'payed', from: :status

    click_on 'Create'

    expect(user.expenses.count).to eq(1)
  end
end

def singin(user)
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Log in'
end
