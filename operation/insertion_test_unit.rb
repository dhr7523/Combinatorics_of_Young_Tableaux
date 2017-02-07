require_relative "insertion"
require "test/unit"

class Tester < Test::Unit::TestCase
	def test_insetion
		assert_equal [[1]].to_tableau, Operation.insertion([].to_tableau,1)

		t=[
			[1,1,1,1,2],
			[2,3,4],
			[3,5]
		].to_tableau
		u=[
			[1,1,1,1,1],
			[2,2,4],
			[3,3],
			[5]
		].to_tableau
		assert_equal u, Operation.insertion(t,1)
	end
	def test_RSK
		assert_equal [[].to_tableau,[].to_tableau], Operation.RSK([].to_word,[].to_word)

		x=[3,2,1,4,2,1,4]
		y=[1,2,3,4,5,6,7]
		z=Operation.RSK(x.to_word,y.to_word)
		assert_equal [
			[1,1,4],
			[2,2],
			[3,4]
		].to_tableau, z[0]
		assert_equal [
			[1,4,7],
			[2,5],
			[3,6]
		].to_tableau, z[1]
	end
end

