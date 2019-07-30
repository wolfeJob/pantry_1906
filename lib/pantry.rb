class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new{0}
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    arg_ingredients = recipe.ingredients
    # [@cheese, @mac]
    arg_ingredients.all? do |ingredient|
      # binding.pry
   stock_check(ingredient) >= recipe.amount_required(ingredient)
    end
    # verdict
  end

end
