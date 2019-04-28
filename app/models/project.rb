class Project < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  validates :name, presence: true

  def draft
    ingredients.empty?
  end

  def name?
    name
  end

  def total_size
    ingredients.size
  end
end
