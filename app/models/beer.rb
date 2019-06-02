# beer.rb

class Beer < ApplicationRecord
  validates :name, presence: true

  def perform(big_dependency)
    big_dependency.execute
    return 42
  end

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

  def brewing_time?
    brewing_time
  end

  def replace_description(new_description)
    self.description = new_description
  end

  def add_description(added_description)
    self.description << added_description
  end

  def set_brewing_time(time_in_days)
    self.brewing_time = time_in_days
  end
end
