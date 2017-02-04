require_relative "../utility/test"
require_relative "Tableau"

check_with_error_expected(false){Tableau.new([])}
check_with_error_expected(false){Tableau.new([[1]])}
check_with_error_expected(false){Tableau.new([[2,2,2,1],[1,1]])}
check_with_error_expected(false){Tableau.new(3,[1])}

#Error case
check_with_error_expected(true){Tableau.new([[1],[1,1]])}
check_with_error_expected(true){Tableau.new([[1],1])}
check_with_error_expected(true){Tableau.set([2,1],[1,1])}
check_with_error_expected(true){Tableau.set([2,1],[1,-1])}
check_with_error_expected(true){Tableau.set([1,2],[2,1])}


