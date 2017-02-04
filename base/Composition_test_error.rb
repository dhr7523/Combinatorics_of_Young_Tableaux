require_relative "../utility/test"
require_relative "Composition"

check_with_error_expected(false){Composition.new()}
check_with_error_expected(false){Composition.new(3,0)}
check_with_error_expected(false){Composition.new(3,1)}
check_with_error_expected(false){Composition.new([1,0,3])}
check_with_error_expected(false){Composition.new([3,0])}
check_with_error_expected(false){Composition.new([3,nil])}
check_with_error_expected(false){Composition.new([1,nil,3])}
check_with_error_expected(false){Composition.new(3){|k|k+1}}
check_with_error_expected(false){[1,0,3].to_composition}
check_with_error_expected(false){[1,nil,3].to_composition}

#error case
check_with_error_expected(true){composition = Composition.new([-1])}
check_with_error_expected(true){composition = Composition.new(3,[1])}
check_with_error_expected(true){composition = Composition.new([1,1.4])}





