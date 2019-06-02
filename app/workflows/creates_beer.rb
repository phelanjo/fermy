class CreatesBeer
  attr_accessor :name, :beer, :beer_type, :description, :brewing_time

  def initialize(options = {})
    @name = options[:name] || nil
    if (options[:beer_type] == "" || options[:beer_type] == nil)
      @beer_type = default_beer_type
    else
      @beer_type = options[:beer_type]
    end
    @description = options[:description] || nil
    @brewing_time = options[:brewing_time] || nil
    @success = false
  end

  def success?
    @success
  end

  def build
    self.beer = Beer.new(
      name: name, 
      beer_type: beer_type, 
      description: description,
      brewing_time: brewing_time)
    beer
  end

  def create
    build
    result = beer.save
    @success = result
  end

  def default_beer_type
    'Generic'
  end
end
