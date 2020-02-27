require 'rails_helper'

feature 'visitor see homepage' do
  scenario 'and see logo' do
    singin(create(:user))

    visit root_path

    expect(page).to have_content('MyBank')
  end
end

def singin(user)
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Log in'
end
