# beer.rb

class Beer < ApplicationRecord

  def exists?
    true
  end

  def name?
    name
  end

  def beer_type?
    beer_type
  end

end
