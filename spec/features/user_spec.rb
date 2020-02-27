require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'get index' do
    scenario 'sucessfully' do
      user = create(:user)

      visit root_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'

      expect(page).to have_content(user.email)
    end
  end
end
