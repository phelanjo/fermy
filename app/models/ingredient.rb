class Ingredient < ApplicationRecord
  belongs_to :project, optional: true
  validates :name, presence: true

  def add_description(description)
    if description.size > 500
      raise Exception.new('Description too large')
    end
  end
end
