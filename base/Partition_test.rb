require 'test/unit'
require_relative "Partition"

class Tester < Test::Unit::TestCase
  def test_transpose
    assert_equal Partition.new([]).transpose, Partition.new([])
    assert_equal Partition.new([1]).transpose, Partition.new([1])
    assert_equal Partition.new([4,4,3,1,1]).transpose, Partition.new([5,3,3,2])
  end
  def test_set
    assert_equal Partition.set(0),[[].to_partition]
    assert_equal Partition.set(1),[[1].to_partition]
    assert_equal Partition.set(2),[[2].to_partition,[1,1].to_partition]
    assert_equal Partition.set(3),[[3].to_partition,[2,1].to_partition,[1,1,1].to_partition]
  end
  def test_outer_corners_indices
    assert_equal [].to_partition.outer_corners_indices, [0]
    assert_equal [1].to_partition.outer_corners_indices, [0,1]
    assert_equal [4,4,2,2].to_partition.outer_corners_indices, [0,2,4]
  end

  def test_set_plus_horizontal_strip_of_size
    assert_equal [].to_partition.set_plus_horizontal_strip_of_size(3),[[3].to_partition]
    assert_equal [4,2,1].to_partition.set_plus_horizontal_strip_of_size(3),
    [
      [7,2,1].to_partition,
      [6,3,1].to_partition,
      [6,2,2].to_partition,
      [6,2,1,1].to_partition,
      [5,4,1].to_partition,
      [5,3,2].to_partition,
      [5,3,1,1].to_partition,
      [5,2,2,1].to_partition,
      [4,4,2].to_partition,
      [4,4,1,1].to_partition,
      [4,3,2,1].to_partition
    ]
  end
  def test_set_plus_vertical_strip_of_size
    assert_equal [].to_partition.set_plus_vertical_strip_of_size(3),[[1,1,1].to_partition]
    assert_equal [4,2,1].to_partition.set_plus_vertical_strip_of_size(3),
    [
      [4,2,1,1,1,1].to_partition,
      [4,2,2,1,1].to_partition,
      [4,3,1,1,1].to_partition,
      [5,2,1,1,1].to_partition,
      [4,3,2,1].to_partition,
      [5,2,2,1].to_partition,
      [5,3,1,1].to_partition,
      [5,3,2].to_partition
    ]
  end
end
