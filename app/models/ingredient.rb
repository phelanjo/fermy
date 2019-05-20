class Ingredient < ApplicationRecord
  belongs_to :project, optional: true
  validates :name, presence: true

  def add_description(description)
    exception = 'Description must be less than 500 chars'

    return exception if description.size > 500
  end
end
