require 'rails_helper.rb'

RSpec.describe Ingredient do
  let(:ingredient) { Ingredient.new }
  let(:valid_ingredient) { Ingredient.new(name: 'hops') }
  let(:valid_ingredient_with_amount) do
    Ingredient.new(name: 'barley', amount: 4)
  end
  let(:valid_ingredient_with_description) do
    Ingredient.new(
      name: 'citra hops',
      amount: 2,
      description: 'dry hopped ingredient'
    )
  end

  it 'can have a description' do
    expect(valid_ingredient_with_description.description).to eq('dry hopped ingredient')
  end

  it 'does not have an amount for a new ingredient' do
    expect(ingredient.amount).to be_nil
  end

  it 'has the user specified amount' do
    expect(valid_ingredient_with_amount.amount).to eq(4)
  end

  it 'is not valid without a user specified name' do
    expect(ingredient).to be_invalid
  end

  it 'is valid with a user specified name' do
    expect(valid_ingredient).to be_valid
  end

  it 'allows a user to provide a name' do
    expect(valid_ingredient.name).to eq('hops')
  end
end
