require 'rails_helper'

RSpec.describe Beer do
  let(:beer) { Beer.new }
  let(:fake_beer) { Beer.new(
    name: 'Fake Beer',
    beer_type: 'Fake IPA',
    description: 'This is a fake beer for unit testing') }

  it 'cannot be created without a name' do
    expect(beer).to be_invalid
  end

  it 'can be created not empty' do
    expect(fake_beer).to be_valid
  end

  it 'does have a name if specified' do
    expect(fake_beer.name?).to eq('Fake Beer')
  end

  it 'is beer_type nil unless specified' do
    expect(beer).to be_of_beer_type(nil)
    expect(beer).not_to be_of_beer_type('Generic')
  end

  it 'does have a beer_type if specified' do
    expect(fake_beer).to be_of_beer_type('Fake IPA')
    expect(fake_beer).not_to be_of_beer_type('Generic')
  end

  it 'has a nil description if nothing is entered' do
    expect(beer.description?).to eq(nil)
  end

  it 'has the description entered by user' do
    expect(fake_beer.description?).to eq("This is a fake beer for unit testing")
  end
end
