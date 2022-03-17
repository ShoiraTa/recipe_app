require 'rails_helper'

RSpec.describe 'Food view', type: :feature do
  describe 'Food index page' do
    before(:each) do
      @user = User.create!(email: 'max@email.com', password: 'password')
      @food = Food.create!(user_id: @user.id, name: 'Ground beef', measurement_unit: 'kg', price: 12)

      visit 'users/sign_in'
      fill_in 'Email', with: 'max@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    scenario 'validates if Food is displayed on foods page' do
      visit "users/#{@user.id}/foods"
      expect(page).to have_content('Foods')
    end

    scenario 'user can create new food using button' do
      visit "users/#{@user.id}/foods"
      expect(page).to have_content('New food')
    end

    scenario 'New Food button redirects to New Food form' do
      visit "users/#{@user.id}/foods"
      click_link 'New food'
      sleep 1.5
      expect(page).to have_content('Price')
    end
  end

  describe 'New food form page' do
    before(:each) do
      @user = User.create!(email: 'max@email.com', password: 'password')
      @food = Food.create!(user_id: @user.id, name: 'Ground beef', measurement_unit: 'kg', price: 12)

      visit 'users/sign_in'
      fill_in 'Email', with: 'max@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit "users/#{@user.id}/foods/new"
    end

    scenario 'form has correct fields' do
      expect(page).to have_content('Name')
      expect(page).to have_content('Measurement unit')
      expect(page).to have_content('Price')
    end

    scenario 'users can create create food' do
      fill_in 'Name', with: 'chicken'
      fill_in 'Measurement unit', with: 'kg'
      fill_in 'Price', with: 6
      click_button 'Create Food'

      expect(page).to have_content('Food created succesfully')
    end
  end
end
