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

  it "allows a user to create a beer with a name and beer type" do
    visit new_beer_path
    fill_in "Name", with: "Fake Beer2"
    fill_in "Beer type", with: "Fake IPA"
    click_on("Create Beer")
    visit beers_path
    @beer = Beer.find_by(name: "Fake Beer2")
    expect(page).to have_selector("#beer_#{@beer.id} .name", text: "Fake Beer2")
    expect(page).to have_selector("#beer_#{@beer.id} .beer_type", text: "Fake IPA")
  end

  it "allows a user to edit a beer already created" do
    visit new_beer_path
    fill_in "Name", with: "Fake Beer"
    fill_in "Beer type", with: "Fake IPA"
    click_on("Create Beer")
    click_on("Edit")
    fill_in "Name", with: "Edited Fake Beer"
    fill_in "Beer type", with: "Edited Fake IPA"
    @beer = Beer.find_by(name: "Fake Beer")
    click_on("Update Beer")
    expect(page).to have_selector("#beer_#{@beer.id} .name", text: "Edited Fake Beer")
    expect(page).to have_selector("#beer_#{@beer.id} .beer_type", text: "Edited Fake IPA")
  end
end
