class Ingredient
  attr_accessor :name, :amount

  def initialize(params = {})
    @name = params.fetch(:name, 'default')
    @amount = params.fetch(:amount, nil)
  end
end
