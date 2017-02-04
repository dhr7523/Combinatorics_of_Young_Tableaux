require 'test/unit'
require_relative "Composition"

class Tester < Test::Unit::TestCase
  def test_size
    assert_equal 0, [].to_composition.size
    assert_equal 10, [3,3,1,3].to_composition.size
  end
  def test_print_diagram
    print "\n"
    [].to_composition.print_diagram
    [3,3,1,3].to_composition.print_diagram
    print "\n"
  end
  def test_addition
    assert_equal [2,4,6].to_composition, [1,2,3].to_composition+[1,2,3].to_composition
    assert_equal [1,1,1].to_composition, [nil,1,0].to_composition+[1,0,1,nil].to_composition
    assert_equal Composition, ([1,2,3].to_composition+[1,2,3].to_composition).class
  end
  def test_concat
    assert_equal [1,2,3,1,2,3].to_composition,[1,2,3].to_composition.concat([1,2,3].to_composition)
    assert_equal [0,1,1,0,1].to_composition,[nil,1,0].to_composition.concat([1,0,1,nil].to_composition)
    assert_equal Composition, [1,2,3].to_composition.concat([1,2,3].to_composition).class
  end
end