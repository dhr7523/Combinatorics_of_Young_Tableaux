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
reqire Composition

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
reqire Composition

* Array
	* to_word

* Word < Array
	* initialize
	* Word.set(n)
	* weight
	* reverse
