class Project
  attr_accessor :ingredients

  def initialize
    @ingredients = []
  end

  def draft
    ingredients.empty?
  end

  def total_size
    ingredients.size
  end
end
