# Composition.rb
* Array
	* to_composition

* Composition
	* initialize
	* size
	* +(other)
	* concat(other)
	* print_diagram

# Partition.rb
require Composition

* Array
	* to_partition

* Partition < Composition
	* initialize
	* transpose
	* +(other)
	* concat(other)
	* outer_corners_indices
	* Part.set(n)
	* set_plus_horizontal_strip_of_size(k)
	* set_plus_vertical_strip_of_size(k)

# Word.rb
require Composition

* Array
	* to_word

* Word < Array
	* initialize
	* Word.set(n)
	* weight
	* reverse

# Tableau.rb
require Partition  
require Word

* Array
	* to_tableau

* Tableau < Array
	* Tableau.set(shape, weight)
	* size
	* shape
	* weight
	* copy
	* transpose
	* read
	* read_row  
records row indices from left to right
	* is_semistandard?
	* print_diagram

# Polynomial.rb
* Array
	* to_polynomial

* Polynomial  
	* @number_of_variables
	* initialize  
	not for use. Use to_polynomial.
	* \+ (other)
	* \* (other)
	* to_array
	* degree_of_leading_terms
	* to_string (variable_strings)
	* ＝＝＝＝＝以下未実装＝＝＝＝＝
	* 変数置換
	* 特殊化（０代入）
	* より大きな数の変数への埋め込み
