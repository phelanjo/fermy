require 'rails_helper'

RSpec.describe 'adding a new fermentation recipe', type: :system do
  it 'allows a user to create a recipe with ingredients' do
    visit new_recipe_path
    fill_in 'Name', with: 'Recipe Kimchi'
    fill_in 'Ingredients', with: 'Daikon\nFish Sauce'
    click_on('Create Recipe')
    visit recipes_path
    @recipe = Recipe.find_by(name: 'Recipe Kimchi')
    expect(page).to have_selector(
      "#recipe_#{@recipe.id} .name", text: 'Recipe Kimchi'
    )
    expect(page).to have_selector(
      "#recipe_#{@recipe.id} .total-size", text: '2'
    )
  end

  it 'does not allow a user to create a recipe without a name' do
    visit new_recipe_path
    fill_in 'Name', with: ''
    fill_in 'Ingredients', with: 'Daikon\nFish Sauce'
    click_on('Create Recipe')
    expect(page).to have_selector('.new_recipe')
  end
end
