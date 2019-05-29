class CreatesRecipe
  attr_accessor :name, :recipe, :ingredients_string

  def initialize(name: '', ingredients_string: '')
    @name = name
    @ingredients_string = ingredients_string
    @success = false
  end

  def success?
    @success
  end

  def build
    self.recipe = Recipe.new(name: name)
    recipe.ingredients = convert_string_to_ingredients
    recipe
  end

  def create
    build
    result = recipe.save
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
