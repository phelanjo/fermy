require 'rails_helper.rb'

RSpec.describe Project do
  it 'considers an empty project to be a draft' do
    project = Project.new
    expect(project.draft).to be_truthy
  end

  it 'allows an ingredient to be added' do
    project = Project.new
    ingredient = Ingredient.new
    project.ingredients << ingredient
    expect(project.total_size).to eq(1)
  end
end
