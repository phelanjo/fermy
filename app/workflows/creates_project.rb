class CreatesProject
  attr_accessor :name, :project, :ingredients_string

  def initialize(name: '', ingredients_string: '')
    @name = name
    @ingredient_string = ingredients_string
  end

  def build
    self.project = Project.new(name: name)
    project.ingredients = convert_string_to_ingredients
    project
  end
