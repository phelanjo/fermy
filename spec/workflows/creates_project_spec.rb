require 'rails_helper'

RSpec.describe CreatesProject do
  it 'creates a project givena  name' do
    creator = CreatesProject.new(name: 'Project Kimchi')
    creator.build
    expect(creator.project.name).to eq('Project Runway')
  end
end
