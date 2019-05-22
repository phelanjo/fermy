require 'rails_helper.rb'

RSpec.describe Project do
  let(:project) { Project.new }
  let(:ingredient) { Ingredient.new }
  let(:fake_hops) { FactoryBot.build_stubbed(:ingredient, name: 'hops') }
  let(:fake_barley) { FactoryBot.build_stubbed(:ingredient, name: 'barley') }
  let(:fake_water) { FactoryBot.build_stubbed(:ingredient, name: 'water') }

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

  it 'calculates the number of ingredients' do
    project.add_ingredient(fake_hops)
    project.add_ingredient(fake_barley)
    project.add_ingredient(fake_water)
    expect(project.total_size).to eq(3)
  end

  describe 'performs big dependency' do
    let(:mock_project) { Project.new }
    let(:stubbed_project) { Project.new }
    let(:big_dependency) { BigDependency.new }

    it 'performs with a mock' do
      expect(mock_project).to receive(:perform).and_return('arbitrary value')
      expect(mock_project.perform(big_dependency)).to eq('arbitrary value')
    end

    it 'works with a partial stub' do
      allow(stubbed_project).to receive(:perform).and_return('arbitrary value')
      expect(stubbed_project.perform(big_dependency)).to eq('arbitrary value')
    end
  end
end
