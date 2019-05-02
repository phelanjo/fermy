require 'rails_helper.rb'

RSpec.describe Ingredient do
  let(:ingredient) { Ingredient.new }

  it 'does not have an amount for a new ingredient' do
    expect(ingredient.amount).to be_nil
  end

  it 'must have a name' do
    expect(ingredient).to be_invalid
  end

  describe 'names' do
    let(:project) { Project.new(name: 'test') }
    let(:ingredient) { Ingredient.new(name: 'hops') }

    it 'is valid with user given name' do
      expect(ingredient).to be_valid
    end

    it 'allow a user to provide the name' do
      expect(ingredient.name).to eq('hops')
    end
  end
end
