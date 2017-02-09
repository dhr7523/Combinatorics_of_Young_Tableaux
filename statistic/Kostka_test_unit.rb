require_relative "Kostka"
require "test/unit"

class Tester < Test::Unit::TestCase
	def test_polynomial
		assert_equal " 0", Kostka.polynomial([1,1,1,1,1],[2,1,1,1]).to_string(["t"])
		assert_equal " 1", Kostka.polynomial([2,1,1,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t +t^2", Kostka.polynomial([2,2,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t +t^2 +t^3", Kostka.polynomial([3,1,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t^2 +t^3 +t^4", Kostka.polynomial([3,2],[2,1,1,1]).to_string(["t"])
		assert_equal " t^3 +t^4 +t^5", Kostka.polynomial([4,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t^6", Kostka.polynomial([5],[2,1,1,1]).to_string(["t"])
	end
	def test_modified
		assert_equal " 0", Kostka.modified([1,1,1,1,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t^6", Kostka.modified([2,1,1,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t^4 +t^5", Kostka.modified([2,2,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t^3 +t^4 +t^5", Kostka.modified([3,1,1],[2,1,1,1]).to_string(["t"])
		assert_equal " t^2 +t^3 +t^4", Kostka.modified([3,2],[2,1,1,1]).to_string(["t"])
		assert_equal " t +t^2 +t^3", Kostka.modified([4,1],[2,1,1,1]).to_string(["t"])
		assert_equal " 1", Kostka.modified([5],[2,1,1,1]).to_string(["t"])
	end
end


