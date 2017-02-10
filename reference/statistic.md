# Statistic.rb
* Statistic
	* a_function (composition)
	* charge (word)  
the weight of word should be a partition type.
	* cocharge (word)  
the weight of word should be a partition type.
	* major_sum (word)
	* inversion_sum (word)

# Kostka.rb
require Statistic  
require polynomial
* Kostka (partition, partition)
* modified_Kostka (partition, partition)

# Polynomial.rb
* Array
	* to_polynomial

* Polynomial  
	* @number_of_variables
	* initialize  
	* \+ (other)
	* \- (other)
	* \* (other)
	* to_array
	* permute_variables (permutation_array)
	* degree_of_leading_terms
	* to_string (variable_strings)
	* ＝＝＝＝＝以下未実装＝＝＝＝＝
	* 特殊化（０代入）
	* より大きな数の変数への埋め込み
