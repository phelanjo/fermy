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

end
