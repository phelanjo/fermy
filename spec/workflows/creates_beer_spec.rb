require "rails_helper"

RSpec.describe CreatesBeer do
  describe "initialization" do
    it "creates a beer given a name and a brewing time" do
      creator = CreatesBeer.new(name: "Fake_Beer_Numba_One", brewing_time: 30)
      creator.build
      expect(creator.beer.name).to eq("Fake_Beer_Numba_One")
      expect(creator.beer.brewing_time).to eq(30)
    end
  end

  describe "failure cases" do
    it "fails when trying to save a beer with no name and brewing time" do
      creator = CreatesBeer.new(name: "", brewing_time: nil)
      creator.create
      expect(creator).not_to be_a_success
    end
  end
end
