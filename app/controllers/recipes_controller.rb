class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :delete]
  
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(recipe_params)
    flash[:message] = recipe.errors.full_messages unless recipe.save
    redirect_to user_url(current_user.id)
    
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :user_id, :image)
  end
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
