require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'Recipe' do
    before(:each) do
      @user = User.create! password: '123456', email: 'user@email.com'
      @recipe = Recipe.create! user_id: @user.id, name: 'New recipe name', preparation_time: 20, cooking_time: 40,
                               description: 'Recipe description', public: true
      visit '/users/sign_in'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    scenario 'Public recipe is displayed on public_recipes page' do
      visit '/public_recipes'
      expect(page).to have_content('New recipe name')
    end

    scenario 'USers can view their own recipes and see delete button' do
      visit '/users/1/recipes'
      expect(page).to have_content('New recipe name')
      expect(page).to have_content('Delete')
    end

    scenario 'USers can delete their recipes' do
      visit '/users/1/recipes'
      expect(page).to have_content('New recipe name')
      click_button 'Delete'
      expect(page).should have_no_content('New recipe name')
    end

    scenario 'Recipe show page displays all the information' do
      visit '/users/1/recipes'
      click_link 'See this recipe'
      expect(page).to have_content('New recipe name')
      expect(page).to have_content('Preparation time')
      expect(page).to have_content('Cooking time')
      expect(page).to have_content('Public')
    end

    scenario 'Users can create a new recipe' do
      visit '/users/1/recipes/new'
      expect(page).to have_content('Create a new recipe')
      fill_in 'Name', with: 'New recipe'
      fill_in 'Description', with: 'Description'
      click_button 'Create Recipe'

      expect(page).to have_content('New recipe')
    end
  end
end
