require 'rails_helper'

RSpec.describe Beer do
  let(:beer) { Beer.new }
  let(:fake_beer) {Beer.new(name: 'Fake Beer', beer_type: 'Fake IPA')}

  it 'can be created empty' do
    beer.exists?
  end

  it 'can be created not empty' do
    fake_beer.exists?
  end

  it 'does not have a name if no name specified' do
    expect(beer.name?).to eq(nil)
  end

  it 'does have a name if specified' do
    expect(fake_beer.name?).to eq('Fake Beer')
  end

  it 'is brew-type nil unless specified' do
    expect(beer.beer_type?).to eq(nil)
  end

  it 'does have a bret-type if specified' do
    expect(fake_beer.beer_type?).to eq('Fake IPA')
  end
end
