require 'rails_helper.rb'

RSpec.describe Recipe do
  it 'considers an empty recipe to be a draft' do
    recipe = Recipe.new
    expect(project.draft).to be_truthy
  end

  it 'allows an ingredient to be added' do
    recipe = Recipe.new
    recipe.add
    expect(recipe.size).to eq(1)
  end
end
