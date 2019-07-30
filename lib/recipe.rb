class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = Hash.new{0}
  end

  def add_ingredients(ingredient,amount)
    @ingredients_required[ingredient] += amount
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
  #8 * 30 = 240
  #2 * 100 = 200 = 440
  @ingredients_required.map{|k,v| k.calories * v}.sum
  end

end
