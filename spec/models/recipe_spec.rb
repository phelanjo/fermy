require 'rails_helper.rb'

RSpec.describe Recipe do
  let(:recipe) { Recipe.new }
  let(:ingredient) { Ingredient.new }
  let(:fake_hops) { FactoryBot.build_stubbed(:ingredient, name: 'hops') }
  let(:fake_barley) { FactoryBot.build_stubbed(:ingredient, name: 'barley') }
  let(:fake_water) { FactoryBot.build_stubbed(:ingredient, name: 'water') }

  it 'considers an empty recipe to be a draft' do
    expect(recipe.draft).to be_truthy
  end

  it 'allows a valid ingredient to be added' do
    recipe.add_ingredient(ingredient)
    expect(recipe.total_size).to eq(0)
    ingredient.name = 'TEST'
    recipe.add_ingredient(ingredient)
    expect(recipe.ingredients[0]).to equal(ingredient)
    expect(recipe.total_size).to eq(1)
  end

  it 'calculates the number of ingredients' do
    recipe.add_ingredient(fake_hops)
    recipe.add_ingredient(fake_barley)
    recipe.add_ingredient(fake_water)
    expect(recipe.total_size).to eq(3)
  end

  describe 'performs big dependency' do
    let(:mock_recipe) { Recipe.new }
    let(:stubbed_recipe) { Recipe.new }
    let(:big_dependency) { BigDependency.new }

    it 'performs with a mock' do
      expect(mock_recipe).to receive(:perform).and_return('arbitrary value')
      expect(mock_recipe.perform(big_dependency)).to eq('arbitrary value')
    end

    it 'works with a partial stub' do
      allow(stubbed_recipe).to receive(:perform).and_return('arbitrary value')
      expect(stubbed_recipe.perform(big_dependency)).to eq('arbitrary value')
    end
  end
end
