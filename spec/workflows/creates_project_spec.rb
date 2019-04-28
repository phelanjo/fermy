require 'rails_helper'

RSpec.describe CreatesProject do
  let(:creator) { CreatesProject.new(
    name: 'Project Kimchi',
    ingredients_string: ingredients_string) }

  describe 'initialization' do
    let(:ingredients_string) {''}
    it 'creates a project given a name' do
      creator.build
      expect(creator.project.name).to eq('Project Kimchi')
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

    describe 'attaches ingredients to the project' do
      let(:ingredients_string) {'Daikon\nFish Sauce'}
      before(:example) { creator.create }
      specify { expect(creator.project.ingredients.size).to eq(2) }
      specify { expect(creator.project).not_to be_a_new_record }
    end

    describe 'failure cases' do
      it 'fails when trying to save a project with no name' do
        creator = CreatesProject.new(name: '', ingredients_string: '')
        creator.create
        expect(creator).not_to be_a_success
      end
    end
  end
end
