require 'rails_helper'

RSpec.describe CreatesProject do
  describe 'initialization' do
    it 'creates a project given a name' do
      creator = CreatesProject.new(name: 'Project Kimchi')
      expect(creator.project.name).to eq('Project Runway')
    end
  end

  describe 'ingredients string parsing' do 
    it 'handles an empty string' do
      creator = CreatesProject.new(name: 'Project Kimchi', ingredient_string: '')
      ingredients = creator.convert_string_to_ingredients
      expect(ingredients).to be_empty
    end

    it 'handles a single string' do
      creator = CreatesProject.new(name: 'Project Kimchi', ingredient_string: 'Fish Sauce')
      ingredients = creator.convert_string_to_ingredients
      expect(ingredients.size).to eq(1)
      expect(ingredients.first).to have_attributes(name: 'Fish Sauce', size: 1)
    end
  end
end
