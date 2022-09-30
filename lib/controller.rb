require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # fetch all recipes from cookbook (repository)
    recipes = @cookbook.all
    # display all the recipes (view)
    @view.display_list(recipes)
  end

  def create
    # ask the user name of recipe (view)
    new_name = @view.ask_for("name")
    # ask user for description (view)\
    new_description = @view.ask_for("description")
    # create a new recipe
    new_recipe = Recipe.new(new_name, new_description)
    # send it to my repo to store it (repository / cookbook)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    # display all recipes
    list
    # ask user which one to delete by the index (view)
    user_index = @view.ask_for_index
    # ask repo to delete it (repository / cookbook)
    @cookbook.remove_recipe(user_index - 1)
  end
end
