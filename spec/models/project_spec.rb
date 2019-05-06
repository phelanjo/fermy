require 'rails_helper.rb'

RSpec.describe Project do
  let(:project) { Project.new }
  let(:ingredient) { Ingredient.new }

  it 'considers an empty project to be a draft' do
    expect(project.draft).to be_truthy
  end

  it 'allows a valid ingredient to be added' do
    project.add_ingredient(ingredient)
    expect(project.total_size).to eq(0)
    ingredient.name = 'TEST'
    project.add_ingredient(ingredient)
    expect(project.total_size).to eq(1)
  end
end
