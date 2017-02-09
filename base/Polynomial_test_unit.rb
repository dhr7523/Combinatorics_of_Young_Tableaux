require "test/unit"
require_relative "Polynomial"

class Tester < Test::Unit::TestCase
	def test_number_of_variables
		a=[].to_polynomial
		assert_equal 1,a.number_of_variables
		b=[[]].to_polynomial
		assert_equal 2,b.number_of_variables
		b=[[[]]].to_polynomial
		assert_equal 3,b.number_of_variables
	end

	def test_addition
		assert_equal [2,2,1].to_polynomial,[1,1].to_polynomial + [1,1,1].to_polynomial
	end

	def test_multiplication
		assert_equal [].to_polynomial,[].to_polynomial * [].to_polynomial
		assert_equal [[]].to_polynomial,[[]].to_polynomial * [[]].to_polynomial
		assert_equal [1,2,2,1].to_polynomial,[1,1].to_polynomial * [1,1,1].to_polynomial
		assert_equal [1,1,1,1].to_polynomial,[1,1].to_polynomial * [1,nil,1].to_polynomial
		assert_equal [].to_polynomial,[1,2,3,2,1].to_polynomial * [].to_polynomial
		a=[[0,1],[2]].to_polynomial # x+2y
		b=[[0,0,1],[0,4],[4]].to_polynomial #x^2+4xy+4y^2
		assert_equal b,a*a
	end
	def test_to_array
		assert_equal [[1,[1,0]],[2,[0,1]]], [[0,1],[2]].to_polynomial.to_array
	end
	def test_degree_of_leading_terms
		assert_equal [[2]], [1,1,1].to_polynomial.degree_of_leading_terms
		assert_equal [[2,0],[1,1],[0,2]], [[1,1,1],[0,1],[1]].to_polynomial.degree_of_leading_terms
	end
	def test_to_string
		assert_equal " 0", [].to_polynomial.to_string(["x"])
		assert_equal " 1", [1].to_polynomial.to_string(["x"])
		assert_equal " x +2y", [[nil,1],[2]].to_polynomial.to_string(["x","y"])
		assert_equal " -Z -Z^3", [0,-1,nil,-1].to_polynomial.to_string(["Z"])
		assert_equal " 1 +3x^2 +5xy -6xz +11x^2yz", [[[1,0,3],[nil,5]],[[0,-6],[nil,0,11]]].to_polynomial.to_string(["x","y","z"])
		assert_equal " x^2 +4xy +4y^2", [[0,0,1],[0,4],[4]].to_polynomial.to_string(["x","y","z"])
		assert_equal " a^2 +4ab +4b^2", [[nil,nil,1],[nil,4],[4]].to_polynomial.to_string(["a","b","c"])
	end
end

