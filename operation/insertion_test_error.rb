require_relative "insertion"
require_relative "../utility/test.rb"

check_with_error_expected(false){Operation.RSK([1,2,3].to_word,[2,1,1].to_word)}
#error
check_with_error_expected(true){Operation.RSK([1,2,3],[2,1,1])}
check_with_error_expected(true){Operation.RSK([1,2].to_word,[2,1,1].to_word)}
