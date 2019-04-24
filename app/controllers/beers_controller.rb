class BeersController < ApplicationController
  def new
    @beer = Beer.new
  end

  def create
    @workflow = CreatesBeer.new(
      name: params[:beer][:name],
      beer_type: params[:beer][:beer_type])
    @workflow.create
    redirect_to beers_path
  end
end
