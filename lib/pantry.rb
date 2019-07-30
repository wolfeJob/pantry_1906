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
  arg_ingredients.each do |ingredient|
    @stock.find_all do |stocked_ingredient, amount|
      if ingredient == stocked_ingredient
        


  end
end
