require_relative "../utility/test"
require_relative "Partition"


check_with_error_expected(false){
	partition = Partition.new()
	partition.print_diagram
}
check_with_error_expected(false){
	partition = Partition.new([3,2,1])
	partition.print_diagram
}
check_with_error_expected(false){
	partition = [3,2,2,1].to_partition
	partition.print_diagram
}

#error case
check_with_error_expected(true){
	partition = Partition.new([0])
	p partition
	partition.print_diagram
}
check_with_error_expected(true){
	partition = Partition.new([3,2,3])
}
check_with_error_expected(true){
	partition = [1,2].to_partition
}
