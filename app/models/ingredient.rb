class Ingredient < ApplicationRecord
  belongs_to :project, optional: true
  validates :name, presence: true

  def add_description(description, big_dependency)
    big_dependency.execute
    exception = 'Description must be less than < 350 chars'

    return exception if description.size > 350
  end
end
