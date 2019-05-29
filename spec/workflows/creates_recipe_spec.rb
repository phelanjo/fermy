require 'rails_helper'

RSpec.describe CreatesRecipe do
  let(:creator) { CreatesRecipe.new(
    name: 'Recipe Kimchi',
    ingredients_string: ingredients_string) }

  describe 'initialization' do
    let(:ingredients_string) {''}
    it 'creates a recipe given a name' do
      creator.build
      expect(creator.recipe.name).to eq('Recipe Kimchi')
    end
  end

  describe 'ingredients string parsing' do
    let(:ingredients) { creator.convert_string_to_ingredients }

    describe 'with an empty string' do
      let(:ingredients_string) { '' }
      specify { expect(ingredients).to be_empty }
    end

    describe 'with a single string' do
      let(:ingredients_string) { 'Fish Sauce' }
      specify { expect(ingredients.size).to eq(1) }
      specify { expect(ingredients.first).to have_attributes(
        name: 'Fish Sauce', amount: 1) }
    end

    describe 'handles an ingredient list with an amount' do
      let(:ingredients_string) { 'Daikon:5' }
      specify { expect(ingredients.size).to eq(1) }
      specify { expect(ingredients.first).to have_attributes(
        name: 'Daikon', amount: 5
      )}
    end

    describe 'attaches ingredients to the recipe' do
      let(:ingredients_string) {'Daikon\nFish Sauce'}
      before(:example) { creator.create }
      specify { expect(creator.recipe.ingredients.size).to eq(2) }
      specify { expect(creator.recipe).not_to be_a_new_record }
    end

    describe 'failure cases' do
      it 'fails when trying to save a recipe with no name' do
        creator = CreatesRecipe.new(name: '', ingredients_string: '')
        creator.create
        expect(creator).not_to be_a_success
      end
    end
  end
end
