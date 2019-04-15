require 'rails_helper'

RSpec.describe Beer do

  it "can be created" do
    beer = Beer.new
  end

  it "is type Generic unless specified" do
    beer = Beer.new
    expect(beer.type?).to eq("Generic")
  end
end
