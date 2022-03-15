require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'Recipe' do
    before(:each) do
      @user = User.create! password: '123456', email: 'user@email.com'
      @recipe = Recipe.create! user_id: @user.id, name: 'New public recipe', preparation_time: 20, cooking_time: 40,
                               description: 'Recipe description', public: true
      @recipe = Recipe.create! user_id: @user.id, name: 'New private recipe', preparation_time: 20, cooking_time: 40,
                               description: 'Recipe description', public: false
      visit '/users/sign_in'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    scenario 'Public recipe is displayed on public_recipes page' do
      visit '/public_recipes'
      expect(page).to have_content('New public recipe')
    end

    scenario 'Private recipe is not displayed on public_recipes page' do
      visit '/public_recipes'
      expect(page).should have_no_content('New private recipe')
    end
  end
end
