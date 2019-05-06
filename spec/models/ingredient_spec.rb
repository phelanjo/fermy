require 'rails_helper.rb'

RSpec.describe Ingredient do
  it 'is valid with only a name specified' do
    ingredient = Ingredient.new
    expect(ingredient.name).to eq(nil)
    expect(ingredient).to be_invalid
    ingredient.name = 'TEST'
    expect(ingredient).to be_valid
  end

  describe 'default state' do
    let(:default_ingredient) do
      Ingredient.new(name: 'fish sauce')
    end

    it 'has a name' do
      expect(default_ingredient.name).to eq('fish sauce')
    end

    it 'does not have an amount' do
      expect(default_ingredient.amount).to eq(nil)
    end

    it 'does not have a unit of measure' do
      expect(default_ingredient.unit).to eq(nil)
    end

    it 'does not have a description' do
      expect(default_ingredient.description).to eq(nil)
    end
  end

  describe 'a complete ingredient object' do
    let(:complete_ingredient) do
      Ingredient.new(
        name: 'cascade hops',
        amount: 5.5,
        unit: 'oz',
        description: 'dry hopping for Fake IPA'
      )
    end

    let(:incomplete_ingredient) do
      Ingredient.new(
        name: 'cascade hops',
        amount: 5.5
      )
    end

    it 'is a complete object' do
      expect(complete_ingredient).to be_complete
    end

    it 'is not a complete object' do
      expect(incomplete_ingredient).not_to be_complete
    end
  end
end
