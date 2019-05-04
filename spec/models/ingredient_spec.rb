require 'rails_helper.rb'

RSpec.describe Ingredient do
  let(:ingredient) { Ingredient.new }
  let(:valid_ingredient) { Ingredient.new(name: 'hops') }

  it 'does not have an amount for a new ingredient' do
    expect(ingredient.amount).to be_nil
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
