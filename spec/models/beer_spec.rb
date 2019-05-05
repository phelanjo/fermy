require 'rails_helper'

RSpec.describe Beer do
  let(:beer) { Beer.new }
  let(:fake_beer) { Beer.new(
    name: 'Fake Beer',
    beer_type: 'Fake IPA',
    description: 'This is a fake beer for unit testing') }
  let(:fake_beer_to_change_description) { Beer.new(
    name: 'Fake Beer Two',
    beer_type: 'Fake Pilsner',
    description: 'This is the first FAKE description') }

  it 'cannot be created without a name' do
    expect(beer).to be_invalid
  end

  it 'can be created with a name' do
    expect(fake_beer).to be_valid
  end

  it 'does have a name if specified' do
    expect(fake_beer).to have_name('Fake Beer')
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
    expect(beer).to have_beer_description(nil)
    expect(beer).not_to have_beer_description("");
  end

  it 'has the description entered by user' do
    expect(fake_beer).to have_beer_description("This is a fake beer for unit testing")
    expect(fake_beer).not_to have_beer_description("");
  end

  it 'can replace its description' do
    expect(fake_beer_to_change_description).to have_beer_description("This is the first FAKE description")
    expect(fake_beer_to_change_description).not_to have_beer_description("This is the second FAKE description")
    fake_beer_to_change_description.replace_description("This is the second FAKE description")
    expect(fake_beer_to_change_description).not_to have_beer_description("This is the first FAKE description")
    expect(fake_beer_to_change_description).to have_beer_description("This is the second FAKE description")
  end

  it 'can add to its description' do
    expect(fake_beer_to_change_description).to have_beer_description("This is the first FAKE description")
    expect(fake_beer_to_change_description).not_to have_beer_description("This is the first FAKE description, and this is added")
    fake_beer_to_change_description.add_description(", and this is added")
    expect(fake_beer_to_change_description).not_to have_beer_description("This is the first FAKE description")
    expect(fake_beer_to_change_description).to have_beer_description("This is the first FAKE description, and this is added")
  end
end
