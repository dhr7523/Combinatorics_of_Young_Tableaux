require "test/unit"
require_relative "Tableau"

class Tester < Test::Unit::TestCase
	def test_size
		assert_equal 0, [].to_tableau.size
		assert_equal 1, [[1]].to_tableau.size
		assert_equal 5, [[1,1,3],[2,3]].to_tableau.size
	end
	def test_shape
		assert_equal [].to_partition, [].to_tableau.shape
		assert_equal [1].to_partition, [[1]].to_tableau.shape
		assert_equal [3,2].to_partition, [[1,1,3],[2,3]].to_tableau.shape
		assert_equal Partition, [[1,1,3],[2,3]].to_tableau.shape.class
	end
	def test_weight
		assert_equal [].to_composition, [].to_tableau.weight
		assert_equal [1].to_composition, [[1]].to_tableau.weight
		assert_equal [2,1,2].to_composition, [[1,1,3],[2,3]].to_tableau.weight
		assert_equal Composition, [[1,1,3],[2,3]].to_tableau.weight.class
	end
	def test_copy
		t=[[3,2,1],[1]].to_tableau
		t_=t.copy
		t_[0][0]=0
		assert_equal [[3,2,1],[1]],t
		assert_equal [[0,2,1],[1]],t_
	end
	def test_transpose
		assert_equal [].to_tableau, [].to_tableau.transpose
		assert_equal [[1,1]].to_tableau, [[1],[1]].to_tableau.transpose
		assert_equal [[1,2,3],[1,2,4],[1,3,4],[2,3],[2]].to_tableau, [[1,1,1,2,2],[2,2,3,3],[3,4,4]].to_tableau.transpose
		assert_equal Tableau, [[1,1,1,2,2],[2,2,3,3],[3,4,4]].to_tableau.transpose.class
	end
	def test_is_semistandard?
		assert_equal true,[].to_tableau.is_semistandard?
		assert_equal true,[
			[1,1,1,2,2],
			[2,2,3,3],
			[3,4,4]].to_tableau.is_semistandard?
		assert_equal false,[
			[1,1,1,2,2],
			[2,2,3,3],
			[1,4,4]].to_tableau.is_semistandard?
	end
	def test_read
		assert_equal [3,4,4,2,2,3,3,1,1,1,2,2].to_word, [[1,1,1,2,2],[2,2,3,3],[3,4,4]].to_tableau.read
		assert_equal Word, [[1,1,1,2,2],[2,2,3,3],[3,4,4]].to_tableau.read.class
	end
	def test_read_row
		assert_equal [1,1,1,2,2,1,1,3,2,2,3,3].to_word, [[1,1,1,2,2],[2,2,3,3],[3,4,4]].to_tableau.read_row
		assert_equal Word, [[1,1,1,2,2],[2,2,3,3],[3,4,4]].to_tableau.read_row.class
	end
	def test_print_diagram
		print "\n"
		[[1,1,1,2,2],[2,2,3,3],[3,4,4]].to_tableau.print_diagram
	end
  def test_set
    assert_equal [[].to_tableau],Tableau.set([],[])
    assert_equal [[[1]].to_tableau],Tableau.set([1],[1])
    assert_equal [
      [[1,1,2,2],[3,3]].to_tableau,
      [[1,1,2,3],[2,3]].to_tableau,
      [[1,1,3,3],[2,2]].to_tableau,
      ],Tableau.set([4,2],[2,2,2])
  end
end
