require 'rails_helper'

feature 'visitor see homepage' do
  scenario 'and see logo' do
    visit root_path

    expect(page).to have_content('MyBank')
  end
end
