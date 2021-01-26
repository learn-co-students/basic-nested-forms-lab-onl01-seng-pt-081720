class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "One")
    @recipe.ingredients.build(name: "Two")
  end

  def create
    @new_recipe = Recipe.create(recipe_params)
    redirect_to recipe_path(@new_recipe)
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
