require 'rails_helper.rb'

RSpec.describe Recipe do
  it 'considers an empty recipe to be a draft' do
    recipe = Recipe.new
    expect(project.draft).to be_truthy
  end
end