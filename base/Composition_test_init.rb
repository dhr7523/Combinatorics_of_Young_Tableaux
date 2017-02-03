require_relative "../utility/test"
require_relative "Composition"

check_with_error_expected(false){
  p composition = Composition.new()
  composition.print_diagram
  puts "size : "+ String(composition.size)
}
check_with_error_expected(false){
  p composition = Composition.new(3,0)
  composition.print_diagram
  puts "size : "+ String(composition.size)
}
check_with_error_expected(false){
  p composition = Composition.new(3,1)
  composition.print_diagram
  puts "size : "+ String(composition.size)
}
check_with_error_expected(false){
  p composition = Composition.new([1,0,3])
  composition.print_diagram
  puts "size : "+ String(composition.size)
}
check_with_error_expected(false){
  p composition = Composition.new([3,0])
  composition.print_diagram
  puts "size : "+ String(composition.size)
}
check_with_error_expected(false){
  p composition = Composition.new([3,nil])
  composition.print_diagram
  puts "size : "+ String(composition.size)
}
check_with_error_expected(false){
  p composition = Composition.new([1,nil,3])
  composition.print_diagram
  puts "size : "+ String(composition.size)
}
check_with_error_expected(false){
  p composition=Composition.new(3){|k|k+1}
  composition.print_diagram
  puts "size : "+ String(composition.size)
}
check_with_error_expected(false){
  p composition=[1,0,3].to_composition
  composition.print_diagram
  puts "size : "+ String(composition.size)
}
check_with_error_expected(false){
  p composition=[1,nil,3].to_composition
  composition.print_diagram
  puts "size : "+ String(composition.size)
}

#error case
check_with_error_expected(true){composition = Composition.new([-1])}
check_with_error_expected(true){composition = Composition.new(3,[1])}
check_with_error_expected(true){composition = Composition.new([1,1.4])}





