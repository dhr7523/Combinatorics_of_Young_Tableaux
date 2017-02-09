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
