require_relative "../utility/test"
require_relative "Polynomial"

check_with_error_expected(false){[[1,[1,1]],[1,[2,2]]].to_polynomial}
check_with_error_expected(false){Polynomial.new([1,2]).to_string(["x","y","z"])}
check_with_error_expected(false){Polynomial.new([[1,2]]).to_string(["x","y","z"])}
check_with_error_expected(false){Polynomial.new([nil,[1]])}
check_with_error_expected(false){Polynomial.new([[1],nil])}
check_with_error_expected(false){Polynomial.new([[1]])}
check_with_error_expected(false){Polynomial.new([[[1],[1]],[[1,1]],[[1,1],[1]]]).permute_variables([0,1,2])}

#error case
check_with_error_expected(true){[[1,[1]],[1,[2,2]]].to_polynomial}

check_with_error_expected(true){Polynomial.new([1,[]])}
check_with_error_expected(true){Polynomial.new([[],1])}

check_with_error_expected(true){Polynomial.new([[1,2]]).to_string(["x"])}

check_with_error_expected(true){Polynomial.new([[]])+Polynomial.new([])}
check_with_error_expected(true){Polynomial.new([[]])*Polynomial.new([])}

check_with_error_expected(true){Polynomial.new([[[1],[1]],[[1,1]],[[1,1],[1]]]).permute_variables([0,1])}
check_with_error_expected(true){Polynomial.new([[[1],[1]],[[1,1]],[[1,1],[1]]]).permute_variables([0,1,3])}

