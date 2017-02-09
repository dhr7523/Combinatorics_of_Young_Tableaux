require_relative "Kostka"
require "test/unit"

class Tester < Test::Unit::TestCase
	def test_Kostka
		assert_equal " 0", Kostka([1,1,1,1,1],[2,1,1,1]).to_string(["t"])
		assert_equal " 1", Kostka([2,1,1,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t +t^2", Kostka([2,2,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t +t^2 +t^3", Kostka([3,1,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t^2 +t^3 +t^4", Kostka([3,2],[2,1,1,1]).to_string(["t"])
		assert_equal " t^3 +t^4 +t^5", Kostka([4,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t^6", Kostka([5],[2,1,1,1]).to_string(["t"])
	end
	def test_modified_Kostka
		assert_equal " 0", modified_Kostka([1,1,1,1,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t^6", modified_Kostka([2,1,1,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t^4 +t^5", modified_Kostka([2,2,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t^3 +t^4 +t^5", modified_Kostka([3,1,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t^2 +t^3 +t^4", modified_Kostka([3,2],[2,1,1,1]).to_string(["t"])
		assert_equal " t +t^2 +t^3", modified_Kostka([4,1],[2,1,1,1]).to_string(["t"])
		assert_equal " 1", modified_Kostka([5],[2,1,1,1]).to_string(["t"])
	end
end


