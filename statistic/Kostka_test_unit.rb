require_relative "Kostka"
require "test/unit"

class Tester < Test::Unit::TestCase
	def test_Kostka
		assert_equal [0], Kostka([1,1,1,1,1],[2,1,1,1])
		assert_equal [1], Kostka([2,1,1,1],[2,1,1,1])
		assert_equal [0,1,1], Kostka([2,2,1],[2,1,1,1])
		assert_equal [0,1,1,1], Kostka([3,1,1],[2,1,1,1])
		assert_equal [0,0,1,1,1], Kostka([3,2],[2,1,1,1])
		assert_equal [0,0,0,1,1,1], Kostka([4,1],[2,1,1,1])
		assert_equal [0,0,0,0,0,0,1], Kostka([5],[2,1,1,1])
	end
	def test_modified_Kostka
		assert_equal [0], modified_Kostka([1,1,1,1,1],[2,1,1,1])
		assert_equal [0,0,0,0,0,0,1], modified_Kostka([2,1,1,1],[2,1,1,1])
		assert_equal [0,0,0,0,1,1], modified_Kostka([2,2,1],[2,1,1,1])
		assert_equal [0,0,0,1,1,1], modified_Kostka([3,1,1],[2,1,1,1])
		assert_equal [0,0,1,1,1], modified_Kostka([3,2],[2,1,1,1])
		assert_equal [0,1,1,1], modified_Kostka([4,1],[2,1,1,1])
		assert_equal [1], modified_Kostka([5],[2,1,1,1])
	end
end


