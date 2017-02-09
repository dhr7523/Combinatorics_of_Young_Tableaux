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



