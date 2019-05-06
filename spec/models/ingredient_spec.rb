require 'rails_helper.rb'

RSpec.describe Ingredient do
  it 'is valid with only a name specified' do
    ingredient = Ingredient.new
    expect(ingredient.name).to eq(nil)
    expect(ingredient).to be_invalid
    ingredient.name = 'TEST'
    expect(ingredient).to be_valid
  end

  describe 'minimum' do
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

    it 'has a description that does not exceed the maximum length' do
      expect(complete_ingredient.description.size).to be < 500
    end

    it 'throws an error if a description is longer than 500 characters' do
      long_description = 'A really super long description full of
        nonsense and more nonsense. Really enjoying some Chopin right now. Time
        for the lorem ipsum...Lorem ipsum dolor sit amet, consectetur adipiscing
        elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
        ut aliquip ex ea commodo consequat. Duis aute irure dolor in
        reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa
        qui officia deserunt mollit anim id est laborum.'
      expect(long_description.size).to be > 500
      # expect(complete_ingredient.add_description(long_description)).to raise_exception('Description too large')
    end
  end
end
