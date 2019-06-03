class BeersController < ApplicationController
  def new
    @beer = Beer.new
  end

  def create
    @workflow = CreatesBeer.new(
      name: params[:beer][:name],
      beer_type: params[:beer][:beer_type],
      description: params[:beer][:description],
      brewing_time: params[:beer][:brewing_time])
    @workflow.create
    if (@workflow.success?)
      redirect_to beers_path
    else
      @beer = @workflow.beer
      render :new
    end
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])

    if @beer.update(beer_params)
      redirect_to @beer
    else
      render 'edit'
    end
  end

  def view
    @beer = Beer.find(params[:id])
  end

  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
  end

  private
    def beer_params
      params.require(:beer).permit(:name, :beer_type, :description)
    end
end
