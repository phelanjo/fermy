# beer.rb

class Beer
  attr_accessor :type

  def initialize(options = {})
    @type = options[:type] || default_brew_type
  end

  def brew_type?
    type
  end

  def default_brew_type
    "Generic"
  end
end
