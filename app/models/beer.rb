# beer.rb

class Beer < ApplicationRecord
  # attr_accessor :beer_type, :name

  # def initialize(options = {})
  #   @beer_type = options[:beer_type] || default_beer_type
  #   @name = options[:name] || nil
  # end

  def exists?
    true
  end

  def name?
    name
  end

  def beer_type?
    beer_type
  end

  # def default_beer_type
  #   'Generic'
  # end

end
