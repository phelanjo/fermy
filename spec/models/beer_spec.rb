require 'rails_helper'

RSpec.describe Beer do
  describe "without user input" do
    let(:factory_beer) { build(:beer) }

    it 'cannot be created' do
      expect(factory_beer).to be_invalid
    end

    it 'is beer type Generic' do
      expect(factory_beer).to be_of_beer_type("Generic")
    end

    it 'has no description' do
      expect(factory_beer).to have_beer_description("")
    end
  end

  describe "with user input" do
    let(:factory_beer) { build(:beer, name: "Fake Factory Beer",
                beer_type: "Fake Factory IPA",
                description: "First description") }

    it 'can be created' do
      expect(factory_beer).to be_valid
    end

    it 'has the correct name' do
      expect(factory_beer).to have_name("Fake Factory Beer")
    end

    it 'has the correct beer type' do
      expect(factory_beer).to be_of_beer_type("Fake Factory IPA")
    end

    it 'has the correct description' do
      expect(factory_beer).to have_beer_description("First description")
    end

    it 'can replace its description' do
      factory_beer.replace_description("New description")
      expect(factory_beer).to have_beer_description("New description")
    end

    it 'can add to its description' do
      factory_beer.add_description(", and this was added")
      expect(factory_beer).to have_beer_description("First description, and this was added")
    end
  end

  describe "big dependency" do
    let(:mock_beer) { Beer.new }
    let(:stubbed_beer) { Beer.new }
    let(:big_dependency) { BigDependency.new }

    it 'can be stubbed' do
      allow(stubbed_beer).to receive(:perform).and_return('arbitrary value')
      expect(stubbed_beer.perform(big_dependency)).to eq('arbitrary value')
    end

    it 'can be mocked' do
      expect(mock_beer).to receive(:perform).and_return('arbitrary value')
      expect(mock_beer.perform(big_dependency)).to eq('arbitrary value')
    end
  end

  describe "brewing time" do
    let(:beer) { build_stubbed(:beer) }

    it 'has no brewing time when instantiated' do
      expect(beer).to have_brewing_time(nil)
    end

    it 'can set its brewing time' do
      beer.set_brewing_time(30)
      expect(beer).to have_brewing_time(30)
    end
  end
end
