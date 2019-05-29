class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  validates :name, presence: true

  def draft
    ingredients.empty?
  end

  def name?
    name
  end

  def add_ingredient(ingredient)
    ingredient.name ? ingredients << ingredient : return
  end

  def total_size
    ingredients.size
  end

  def perform(big_dependency)
    big_dependency.execute
    'arbitrary value'
  end
end
