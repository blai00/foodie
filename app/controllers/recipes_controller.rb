class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
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
    params.require(:recipe).permit(:name, :description, :user_id, :instructions)
  end
  def set_recipe
    @recipes = Recipie.find(params[:id])
  end
end
