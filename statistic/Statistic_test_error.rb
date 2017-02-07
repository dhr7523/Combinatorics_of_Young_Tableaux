require_relative "Statistic"
require_relative "../utility/test"
include Statistic

check_with_error_expected(true){a_function([3,4,1])}
check_with_error_expected(true){charge([2,3,4,1])}
check_with_error_expected(true){charge([3,4,1].to_word)}
