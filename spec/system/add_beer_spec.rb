require "rails_helper"

RSpec.describe "adding a beer", type: :system do
  it "allows a user to create a beer with a name and brewing time" do
      visit new_beer_path
      fill_in "Name", with: "Fake Beer"
      fill_in "Brewing time", with: 30
      click_on("Create Beer")
      visit beers_path
      @beer = Beer.find_by(name: "Fake Beer")
      expect(page).to have_selector("#beer_#{@beer.id} .name", text: "Fake Beer")
      expect(page).to have_selector("#beer_#{@beer.id} .beer_type", text: "Generic")
      expect(page).to have_selector("#beer_#{@beer.id} .brewing_time", text: 30)
  end

  it "does not allow a user to create a beer without a name and brewing time" do
    visit new_beer_path
    fill_in "Name", with: ""
    fill_in "Brewing time", with: nil
    click_on("Create Beer")
    expect(page).to have_selector(".new_beer")
  end

  it "allows a user to create a beer with a name, beer type, description, and brewing_time" do
    visit new_beer_path
    fill_in "Name", with: "Fake Beer2"
    fill_in "Beer type", with: "Fake IPA"
    fill_in "Description", with: "FAKE DESCRIPTION"
    fill_in "Brewing time", with: 30
    click_on("Create Beer")
    visit beers_path
    @beer = Beer.find_by(name: "Fake Beer2")
    expect(page).to have_selector("#beer_#{@beer.id} .name", text: "Fake Beer2")
    expect(page).to have_selector("#beer_#{@beer.id} .beer_type", text: "Fake IPA")
    expect(page).to have_selector("#beer_#{@beer.id} .description", text: "FAKE DESCRIPTION")
    expect(page).to have_selector("#beer_#{@beer.id} .brewing_time", text: 30)
  end

  it "does not allow a user to create a beer with type/description without a name and brewing time" do
    visit new_beer_path
    fill_in "Name", with: ""
    fill_in "Beer type", with: "Fake IPA"
    fill_in "Description", with: "FAKE DESCRIPTION"
    fill_in "Brewing time", with: nil
    click_on("Create Beer")
    expect(page).to have_selector(".new_beer")
  end
end
