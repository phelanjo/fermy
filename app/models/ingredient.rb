class Ingredient < ApplicationRecord
  belongs_to :recipe, optional: true
  validates :name, presence: true
  

  def add_description(description)
    exception = 'Description must be less than 350 chars'

    return exception if description.size > 350
  end
end
