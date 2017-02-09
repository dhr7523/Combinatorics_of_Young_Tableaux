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
		b=[[0,0,1],[0,4],[4]].to_polynomial #x^2+2xy+y^2
		assert_equal b,a*a
	end
end

[[nil,1],[2]].to_polynomial.print_(["x","y"])
[0,-1,nil,-1].to_polynomial.print_(["x","y"])
[[[1,-2,3],[nil,5]],[[5,-6],[7,8],[9,10,11]]].to_polynomial.print_(["x","y","z"])
