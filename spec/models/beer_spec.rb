require 'rails_helper'

RSpec.describe Beer do
  let(:beer) { Beer.new }
  let(:fake_beer) {Beer.new(name: 'Fake', beer_type: 'IPA')}

  it 'can be created empty' do
    beer.exists?
  end

  it 'can be created with a name' do
    expect(fake_beer.name?).to eq('Fake')
  end

  it 'has does not have a name if no name specified' do
    expect(beer.name?).to eq(nil)
  end

  it 'is brew-type Generic unless specified' do
    expect(beer.beer_type?).to eq('Generic')
  end
end
