require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'login' do
    before(:each) do
      User.create! password: '123456', email: 'user@email.com'
      visit '/users/sign_in'
    end

    scenario 'Login user page renders correctly' do
      expect(page).to have_content('Log in')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end

    scenario ' I can log in with correct user details' do
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end

    scenario ' I can log in with correct user details' do
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Public recipes')
    end
  end
end
