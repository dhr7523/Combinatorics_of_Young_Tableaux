require_relative "Statistic"
require "test/unit"
include Statistic

class Tester < Test::Unit::TestCase
	def test_a_function
		assert_equal 0, a_function([].to_composition)
		assert_equal 0, a_function([0].to_composition)
		assert_equal 0, a_function([10].to_composition)
		assert_equal 2, a_function([0,0,1].to_composition)
		assert_equal 6, a_function([3,4,1].to_composition)
	end
	def test_charge
		assert_equal 0, charge([].to_word)
		assert_equal 0, charge([1,2,3,4,5].to_word)
		assert_equal 2, charge([3,2,1,2,1].to_word)
	end
	def test_cocharge
		assert_equal 0, cocharge([].to_word)
		assert_equal 0, cocharge([2,2,2,1,1,1].to_word)
		assert_equal 10, cocharge([1,2,3,4,5].to_word)
	end
	def test_major_sum
		assert_equal 0, major_sum([].to_word)
		assert_equal 1+2, major_sum([3,2,1].to_word)
		assert_equal 2+5+6+7, major_sum([4,7,3,5,5,4,3,2,].to_word)
	end
	def test_inversion_sum
		assert_equal 0, inversion_sum([].to_word)
		assert_equal 1, inversion_sum([2,1].to_word)
		assert_equal 10, inversion_sum([5,4,3,2,1].to_word)
		assert_equal 6, inversion_sum([2,2,2,1,1].to_word)
	end
end
