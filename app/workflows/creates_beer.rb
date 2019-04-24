class CreatesBeer
  attr_accessor :name, :beer, :beer_type

  def initialize(options = {})
    @name = options[:name] || nil
    if (options[:beer_type] == "" || options[:beer_type] == nil)
      @beer_type = default_beer_type
    else
      @beer_type = options[:beer_type]
    end
    # @beer_type = options[:beer_type].blank? ? options[:beer_type] : default_beer_type
  end

  def create
    build
    beer.save
  end

  def build
    self.beer = Beer.new(name: name, beer_type: beer_type)
    beer
  end

  def default_beer_type
    'Generic'
  end
end
