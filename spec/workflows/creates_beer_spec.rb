require "rails_helper"

RSpec.describe CreatesBeer do
  # describe "initialization" do

    it "creates a beer given a name" do
      creator = CreatesBeer.new(name: "Fake_Beer_Numba_One")
      creator.build
      expect(creator.beer.name).to eq("Fake_Beer_Numba_One")
    end
  # end

  # describe "beer string parsing" do
  #
  #   it "handles and empty beer_type" do
  #     creator = CreatesBeer.new(name: "Fake_Beer", beer_type: "")
  #     beer_type = creator.beer_type?
  #     expect(beer_type).to eq("Generic")
  #   end
  # end
end