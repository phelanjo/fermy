# beer.rb

class Beer < ApplicationRecord
  validates :name, presence: true
  validates :brewing_time, presence: true

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

  def replace_description(new_description)
    self.description = new_description
  end

  def add_description(added_description)
    self.description << added_description
  end

  def set_brewing_time(time_in_days)
    self.brewing_time = time_in_days
  end

  def set_brew_start_date
    self.brew_start_date = Date.today
  end

  def set_brew_end_date
    self.brew_end_date = set_brew_start_date + brewing_time
  end
end
