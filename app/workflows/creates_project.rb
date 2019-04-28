class CreatesProject
  attr_accessor :name, :project, :ingredients_string

  def initialize(name: '', ingredients_string: '')
    @name = name
    @ingredients_string = ingredients_string
    @success = false
  end

  def success?
    @success
  end

  def build
    self.project = Project.new(name: name)
    project.ingredients = convert_string_to_ingredients
    project
  end

  def create
    build
    result = project.save
    @success = result
  end

  def convert_string_to_ingredients
    ingredients_string.split('\n').map do |one_ingredient|
      name, amount_string = one_ingredient.split(':')
      Ingredient.new(name: name, amount: amount_as_integer(amount_string))
    end
  end

  def amount_as_integer(amount_string)
    return 1 if amount_string.blank?

    [amount_string.to_i, 1].max
  end
end
