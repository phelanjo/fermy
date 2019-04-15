# beer.rb

class Beer
  attr_accessor :beer_type

  def initialize(options = {})
    @type = options[:beer_type] || default_brew_type
  end

  def brew_type?
    beer_type
  end

  def default_brew_type
    "Generic"
  end
end
