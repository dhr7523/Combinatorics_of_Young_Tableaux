require_relative "evacuation"
require "test/unit"

class Tester < Test::Unit::TestCase
	def test_evacuation
		assert_equal [].to_tableau,Operation.evacuation([].to_tableau)
		t=[
			[1,1,1,1,2],
			[2,3,4],
			[3,5]
		].to_tableau
		u=[
			[5,3,3,1,1],
			[4,2,1],
			[2,1]
		].to_tableau
		assert_equal u, Operation.evacuation(t)
		assert_equal t, Operation.evacuation(u)
	end
	def test_evacuation_relabeled
		assert_equal [].to_tableau,Operation.evacuation_relabeled([].to_tableau)
		t=[
			[1,1,1,1,2],
			[2,3,4],
			[3,5]
		].to_tableau
		u=[
			[1,3,3,5,5],
			[2,4,5],
			[4,5]
		].to_tableau
		assert_equal u, Operation.evacuation_relabeled(t)
		assert_equal t, Operation.evacuation_relabeled(u)
	end
end
