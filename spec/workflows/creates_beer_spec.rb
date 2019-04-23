require "rails_helper"

RSpec.describe CreatesBeer do
  it "creates a beer given a name" do
    creator = CreatesBeer.new(name: "Fake_Beer_Numba_One")
    creator.build
    expect(creator.beer.name).to eq("Fake_Beer_Numba_One")
  end
end
