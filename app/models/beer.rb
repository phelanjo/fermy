# beer.rb

class Beer
  attr_accessor :beer_type

  def initialize(options = {})
    @type = options[:beer_type] || default_beer_type
  end

  def beer_type?
    beer_type
  end

  def default_beer_type
    "Generic"
  end
end
