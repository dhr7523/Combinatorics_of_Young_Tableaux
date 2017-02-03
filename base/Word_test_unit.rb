require "test/unit"
require_relative "Word"

class Tester < Test::Unit::TestCase
  def test_weight
    assert_equal [0].to_composition,[].to_word.weight
    assert_equal [1,2,1].to_composition,[2,3,2,1].to_word.weight
  end
  def test_class
    assert_equal Composition,[].to_word.weight.class
  end
  def test_set
    assert_equal [[1,2,2],[2,1,2],[2,2,1]].map {|e| e.to_word}, set=Word.set([1,2].to_composition).sort
    assert_equal Word, set[0].class
    assert_equal [], Word.set([].to_composition)
    assert_equal [], Word.set([0,0].to_composition)
  end
  def test_reverse
    assert_equal [1,2,3,4,5].to_word, [5,4,3,2,1].to_word.reverse
  end
end
