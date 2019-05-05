# beer.rb

class Beer < ApplicationRecord
  validates :name, presence: true

  def exists?
    true
  end

  def name?
    name
  end

  def beer_type?
    beer_type
  end

  def description?
    description
  end

  def replace_description(new_description)
    self.description = new_description
  end

  def add_description(added_description)

  end
end
