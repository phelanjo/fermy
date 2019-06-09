require "rails_helper"

RSpec.describe "adding a beer", type: :system do
  it "allows a user to create a beer with a default beer type" do
    visit new_beer_path
    fill_in "Name", with: "Fake Beer"
    fill_in "Brewing time", with: 30
    click_on("Create Beer")
    expect(page).to have_selector(".name", text: "Fake Beer")
    expect(page).to have_selector(".beer_type", text: "Generic")
    expect(page).to have_selector(".brewing_time", text: 30)
    expect(page).to have_selector(".brew_start_date", text: Date.today)
    expect(page).to have_selector(".brew_end_date", text: Date.today + 30)
  end

  it "does not allow a user to create a beer without a name and brewing time" do
    visit new_beer_path
    fill_in "Name", with: ""
    fill_in "Brewing time", with: nil
    click_on("Create Beer")
    expect(page).to have_selector(".new_beer")
  end

  it "allows a user to create a beer with a name, beer type, description, and brewing time" do
    visit new_beer_path
    fill_in "Name", with: "Fake Beer2"
    fill_in "Beer type", with: "Fake IPA"
    fill_in "Description", with: "FAKE DESCRIPTION"
    fill_in "Brewing time", with: 30
    click_on("Create Beer")
    expect(page).to have_selector(".name", text: "Fake Beer2")
    expect(page).to have_selector(".beer_type", text: "Fake IPA")
    expect(page).to have_selector(".description", text: "FAKE DESCRIPTION")
    expect(page).to have_selector(".brewing_time", text: 30)
    expect(page).to have_selector(".brew_start_date", text: Date.today)
    expect(page).to have_selector(".brew_end_date", text: Date.today + 30)
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

  it "allows a user to edit a beer already created" do
    beer = Beer.create(name: 'Fake', brewing_time: 1)
    visit edit_beer_path(beer)
    fill_in "Name", with: "Edited Fake Beer"
    fill_in "Beer type", with: "Edited Fake IPA"
    fill_in "Description", with: "Edited Fake description"
    fill_in "Brewing time", with: 30
    click_on("Update Beer")
    expect(page).to have_selector(".name", text: "Fake Beer")
    expect(page).to have_selector(".beer_type", text: "Fake IPA")
    expect(page).to have_selector(".description", text: "Fake description")
    expect(page).to have_selector(".brewing_time", text: 30)
    expect(page).to have_text("#{beer.brew_start_date}")
    expect(page).to have_text("#{beer.brew_end_date}")
  end

  it "allows a user to see an individual beer" do
    beer = Beer.create(name: "Fake Beer", beer_type: "Fake IPA", description: "Fake description", brewing_time: 30)
    visit beers_path(beer)
    expect(page).to have_selector(".name", text: "Fake Beer")
    expect(page).to have_selector(".beer_type", text: "Fake IPA")
    expect(page).to have_selector(".description", text: "Fake description")
    expect(page).to have_selector(".brewing_time", text: 30)
    expect(page).to have_text("#{beer.brew_start_date}")
    expect(page).to have_text("#{beer.brew_end_date}")
  end

end
