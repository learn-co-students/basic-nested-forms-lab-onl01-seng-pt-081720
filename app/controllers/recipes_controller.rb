class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new(title: "chocolate cake")
    @recipe.ingredients.build(name: "sugar", quantity: "1 tbsp")
    @recipe.ingredients.build(name: "vanilla", quantity: "1 tsp")
  end

  def create
    Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :name, 
        :quantity
      ]
      )
  end
end
