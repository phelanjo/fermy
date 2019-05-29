require "rails_helper"

RSpec.describe "adding a beer", type: :system do
  it "allows a user to create a beer with a name" do
      visit new_beer_path
      fill_in "Name", with: "Fake Beer"
      click_on("Create Beer")
      visit beers_path
      @beer = Beer.find_by(name: "Fake Beer")
      expect(page).to have_selector("#beer_#{@beer.id} .name", text: "Fake Beer")
      expect(page).to have_selector("#beer_#{@beer.id} .beer_type", text: "Generic")
  end

  it "does not allow a user to create a beer without a name" do
    visit new_beer_path
    fill_in "Name", with: ""
    click_on("Create Beer")
    expect(page).to have_selector(".new_beer")
  end

  it "allows a user to create a beer with a name, beer type, and description" do
    visit new_beer_path
    fill_in "Name", with: "Fake Beer3"
    fill_in "Beer type", with: "Fake IPA"
    fill_in "Description", with: "FAKE DESCRIPTION"
    click_on("Create Beer")
    visit beers_path
    @beer = Beer.find_by(name: "Fake Beer3")
    expect(page).to have_selector("#beer_#{@beer.id} .name", text: "Fake Beer3")
    expect(page).to have_selector("#beer_#{@beer.id} .beer_type", text: "Fake IPA")
    expect(page).to have_selector("#beer_#{@beer.id} .description", text: "FAKE DESCRIPTION")
  end

  it "does not allow a user to create a beer with type/description without a name" do
    visit new_beer_path
    fill_in "Name", with: ""
    fill_in "Beer type", with: "Fake IPA"
    fill_in "Description", with: "FAKE DESCRIPTION"
    click_on("Create Beer")
    expect(page).to have_selector(".new_beer")
  end
end
