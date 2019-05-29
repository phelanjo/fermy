class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @workflow = CreatesRecipe.new(
      name: params[:recipe][:name],
      ingredients_string: params[:recipe][:ingredients]
    )
    @workflow.create
    if @workflow.success?
      redirect_to recipes_path
    else
      @recipe = @workflow.recipe

      render :new
    end
  end
end
