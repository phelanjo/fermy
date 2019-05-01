require 'rails_helper'

RSpec.describe Beer do
  let(:beer) { Beer.new }
  let(:fake_beer) { Beer.new(
    name: 'Fake Beer',
    beer_type: 'Fake IPA',
    description: 'This is a fake beer for unit testing') }

  it 'cannot be created empty' do
    expect(beer).to be_invalid
  end

  it 'can be created not empty' do
    expect(fake_beer).to be_valid
  end

  it 'does not have a name if no name specified' do
    expect(beer.name?).to eq(nil)
  end

  it 'does have a name if specified' do
    expect(fake_beer.name?).to eq('Fake Beer')
  end

  it 'is beer_type nil unless specified' do
    expect(beer.beer_type?).to eq(nil)
  end

  it 'does have a beer_type if specified' do
    expect(fake_beer.beer_type?).to eq('Fake IPA')
  end

  it 'has an empty description if nothing is entered' do
    expect(beer.description?).to eq(nil)
  end

  it 'has a description if entered by user' do
    expect(fake_beer.description?).to eq("This is a fake beer for unit testing")
  end
end
