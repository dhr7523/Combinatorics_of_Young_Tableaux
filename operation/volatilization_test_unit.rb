require_relative "volatilization"
require "test/unit"

class Tester < Test::Unit::TestCase
	def test_volatilization
		assert_equal [].to_tableau,Operation.volatilization([].to_tableau)
		t=[
			[1,1,1,1,2],
			[2,3,4],
			[3,5]
		].to_tableau
		u=[
			[5,4,2,2,1],
			[3,3,1],
			[1,1]
		].to_tableau
		assert_equal u, Operation.volatilization(t)
		assert_equal t, Operation.volatilization(u)
	end
	def test_evacuation_relabeled
		assert_equal [].to_tableau,Operation.volatilization_relabeled([].to_tableau)
		t=[
			[1,1,1,1,2],
			[2,3,4],
			[3,5]
		].to_tableau
		u=[
			[1,2,4,4,5],
			[3,3,5],
			[5,5]
		].to_tableau
		assert_equal u, Operation.volatilization_relabeled(t)
		assert_equal t, Operation.volatilization_relabeled(u)
	end
end
