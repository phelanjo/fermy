require "rails_helper"

RSpec.describe "adding a beer", type: :system do
  it "allows a user to create a beer with a name" do
      visit new_beer_path
      fill_in "Name", with: "Fake Beer"
      click_on("Create Beer")
      visit beers_path
      expect(page).to have_content("Fake Beer")
      expect(page).to have_content("Generic")
  end

  it "allows a user to create a beer with a name and beer type" do
    visit new_beer_path
    fill_in "Name", with: "Fake Beer2"
    fill_in "Beer type", with: "Fake IPA"
    click_on("Create Beer")
    visit beers_path
    expect(page).to have_content("Fake Beer2")
    expect(page).to have_content("Fake IPA")
  end
end
