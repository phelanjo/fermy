require "rails_helper"

RSpec.describe "adding a beer", type: :system do
  it "allows a user to create a beer with a name" do
      visit new_beer_path
      fill_in "Name", with: "Fake Beer"
      fill_in "Beer Type", with: "Fake IPA"
  end
end
