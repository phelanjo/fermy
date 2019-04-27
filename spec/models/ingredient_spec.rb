require 'rails_helper.rb'

RSpec.describe Ingredient do
  let(:ingredient) { Ingredient.new }

  it 'does not have an amount for a new ingredient' do
    expect(ingredient.amount).to be_nil
  end
end
