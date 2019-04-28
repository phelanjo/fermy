class Project < ApplicationRecord
  has_many :ingredients, dependent: :destroy

  def draft
    ingredients.empty?
  end

  def total_size
    ingredients.size
  end
end
