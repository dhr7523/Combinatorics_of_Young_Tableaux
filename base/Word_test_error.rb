require_relative "../utility/test"
require_relative "Word"

check_with_error_expected(false){
	Word.new()
}
check_with_error_expected(false){
	Word.new([])
}
check_with_error_expected(false){
	Word.new([1,4,4,1,2])
}

#error case
check_with_error_expected(true){
	Word.new([0])
}
check_with_error_expected(true){
	Word.new([-1])
}
check_with_error_expected(true){
	Word.new([1,-1,2,3])
}
check_with_error_expected(true){
	Word.set([2,1])
}
