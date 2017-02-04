require_relative "../utility/test"
require_relative "Partition"

check_with_error_expected(false){Partition.new()}
check_with_error_expected(false){Partition.new([0])}
check_with_error_expected(false){Partition.new([3,2,1])}
check_with_error_expected(false){[3,2,2,1].to_partition}

#error case
check_with_error_expected(true){Partition.new([3,2,3])}
check_with_error_expected(true){[1,2].to_partition}
