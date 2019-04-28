require 'rails_helper'

RSpec.describe 'adding a new fermentation project', type: :system do
  it 'allows a user to create a project with ingredients' do
    visit new_project_path
    fill_in 'Name', with: 'Project Kimchi'
    fill_in 'Ingredients', with: 'Daikon\nFish Sauce'
    click_on('Create Project')
    visit projects_path
    expect(page).to have_content('Project Kimchi')
    expect(page).to have_content('Daikon')
    expect(page).to have_content('Fish Sauce')
  end
end
