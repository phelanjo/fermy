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

  describe "faking big dependency" do
    let(:factory_beer) { build(:beer, name: "Fake Factory Beer",
                beer_type: "Fake Factory IPA",
                description: "First description") }
    let(:stubbed_beer) { build(:beer, name: "Fake Factory Beer",
                beer_type: "Fake Factory IPA",
                description: "First description") }

    it 'can run the dependency' do
      result = factory_beer.perform(BigDependency.new)
      expect(result).to eq(42)
    end

    it 'can run with a fake dependency' do
      result = factory_beer.perform(FakeBigDependency.new)
      expect(result).to eq(42)
    end

    it 'can run stubbed' do
      allow(stubbed_beer).to receive(:perform).and_return(42)
      expect(stubbed_beer.perform(FakeBigDependency.new)).to eq(42)
    end
  end
end
