class BeersController < ApplicationController
  def new
    @beer = Beer.new
  end

  def create
    @workflow = CreatesBeer.new(
      name: params[:beer][:name],
      beer_type: params[:beer][:beer_type])
    @workflow.create
    if (@workflow.success?)
      redirect_to beers_path
    else
      @beer = @workflow.beer
      render :new
    end
  end

  def index
    @beers = Beer.all
  end

end
