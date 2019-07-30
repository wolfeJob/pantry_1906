require './lib/ingredient'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RecipeTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_attributes
    assert_equal "Mac and Cheese", @mac_and_cheese.name
    assert_equal ({}), @mac_and_cheese.ingredients_required
  end

  def test_add_ingredients
    @mac_and_cheese.add_ingredients(@cheese, 2)
    @mac_and_cheese.add_ingredients(@mac, 8)
    expected = {
            @cheese => 2,
            @mac => 8
              }
    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_amount_required
    @mac_and_cheese.add_ingredients(@cheese, 2)
    @mac_and_cheese.add_ingredients(@mac, 8)
    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end

  def test_ingredients
    @mac_and_cheese.add_ingredients(@cheese, 2)
    @mac_and_cheese.add_ingredients(@mac, 8)
    assert_equal [@cheese, @mac], @mac_and_cheese.ingredients
  end

  def test_total_calories
    @mac_and_cheese.add_ingredients(@cheese, 2)
    @mac_and_cheese.add_ingredients(@mac, 8)
    assert_equal 440, @mac_and_cheese.total_calories
  end

end
