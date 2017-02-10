require "test/unit"
require_relative "Polynomial"

class Tester < Test::Unit::TestCase
	def test_to_polynomial
		assert_equal Polynomial.new([]), [[0,[0]]].to_polynomial
		assert_equal Polynomial.new([1,1,2]), [[1,[0]],[1,[1]],[2,[2]]].to_polynomial
		assert_equal Polynomial.new([[0,1],[2]]), [[1,[1,0]],[2,[0,1]]].to_polynomial
		assert_equal Polynomial.new([[0,0,1],[0,4],[4]]), [[1,[2,0]],[4,[1,1]],[4,[0,2]]].to_polynomial
	end

	def test_number_of_variables
		a=Polynomial.new([])
		assert_equal 1,a.number_of_variables
		a=Polynomial.new([[]])
		assert_equal 2,a.number_of_variables
		a=Polynomial.new([[[]]])
		assert_equal 3,a.number_of_variables
	end
	def test_addition
		assert_equal Polynomial.new([2,2,1]),Polynomial.new([1,1]) + Polynomial.new([1,1,1])
	end
	def test_subtraction
		assert_equal Polynomial.new([0,0,-1]),Polynomial.new([1,1]) - Polynomial.new([1,1,1])
	end
	def test_multiplication
		assert_equal Polynomial.new([]),Polynomial.new([]) * Polynomial.new([])
		assert_equal Polynomial.new([[]]),Polynomial.new([[]]) * Polynomial.new([[]])
		assert_equal Polynomial.new([1,2,2,1]),Polynomial.new([1,1]) * Polynomial.new([1,1,1])
		assert_equal Polynomial.new([1,1,1,1]),Polynomial.new([1,1]) * Polynomial.new([1,nil,1])
		assert_equal Polynomial.new([]),Polynomial.new([1,2,3,2,1]) * Polynomial.new([])
		a=Polynomial.new([[0,1],[2]]) # x+2y
		b=Polynomial.new([[0,0,1],[0,4],[4]]) #x^2+4xy+4y^2
		assert_equal b,a*a
	end
	def test_to_array
		assert_equal [[1,[1,0]],[2,[0,1]]], Polynomial.new([[0,1],[2]]).to_array
	end
	def test_degree_of_leading_terms
		assert_equal [[2]], Polynomial.new([1,1,1]).degree_of_leading_terms
		assert_equal [[2,0],[1,1],[0,2]], Polynomial.new([[1,1,1],[0,1],[1]]).degree_of_leading_terms
	end
	def test_to_string
		assert_equal " 0", Polynomial.new([]).to_string(["x"])
		assert_equal " 1", Polynomial.new([1]).to_string(["x"])
		assert_equal " x +2y", Polynomial.new([[nil,1],[2]]).to_string(["x","y"])
		assert_equal " -Z -Z^3", Polynomial.new([0,-1,nil,-1]).to_string(["Z"])
		assert_equal " 1 +3x^2 +5xy -6xz +11x^2yz", Polynomial.new([[[1,0,3],[nil,5]],[[0,-6],[nil,0,11]]]).to_string(["x","y","z"])
		assert_equal " x^2 +4xy +4y^2", Polynomial.new([[0,0,1],[0,4],[4]]).to_string(["x","y","z"])
		assert_equal " a^2 +4ab +4b^2", Polynomial.new([[nil,nil,1],[nil,4],[4]]).to_string(["a","b","c"])
	end
end

