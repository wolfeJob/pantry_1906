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
  
    stock_sum = []
    arg_sum = []
    stock_sum << @stock.fetch_values(recipe.ingredients.name)
    arg_sum <<   recipe.ingredients_required.fetch_values(recipe.ingredients.name)
    stock_sum.sum == arg_sum.sum
  end
end
