require 'rails_helper'

RSpec.describe 'adding a new fermentation project', type: :system do
  it 'allows a user to create a project with ingredients' do
    visit new_project_path
    fill_in 'Name', with: 'Project Kimchi'
    fill_in 'Ingredients', with: 'Daikon:2\nFish Sauce'
    click_on('Create Project')
    visit projects_path
    @project = Project.find_by(name: 'Project Kimchi')
    expect(page).to have_selector(
      "#project_#{@project.id} .name", text: 'Project Kimchi'
    )
    expect(page).to have_selector(
      "#project_#{@project.id} .total-size", text: '2'
    )
  end
end
