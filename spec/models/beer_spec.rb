require 'rails_helper'

RSpec.describe Beer do
  let(:beer) { Beer.new }

  it "can be created" do
    beer.exists?
  end

  it "is brew-type Generic unless specified" do
    expect(beer.beer_type?).to eq("Generic")
  end
end
