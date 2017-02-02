require_relative "deep_copy"

#dupを調べる
puts "================dup================"
test=[[1,2],[3,4]]
test2=test.dup
test2[0]=[]
p test
p test2

print "\n"

test=[[1,2],[3,4]]
test2=test.dup
test2[0][0]=0
p test
p test2

print "\n"

test=[[[[1]]],[3,4]]
test2=test.dup
test2[0][0][0][0]=0
p test
p test2

puts "================deep_copy================"
test=[[1,2],[3,4]]
test2=test.deep_copy
test2[0]=[]
p test
p test2

print "\n"

test=[[1,2],[3,4]]
test2=test.deep_copy
test2[0][0]=0
p test
p test2

print "\n"

test=[[[[1]]],[3,4]]
test2=test.deep_copy
test2[0][0][0][0]=0
p test
p test2

puts "================deep_copy_================"
test=[[1,2],[3,4]]
test2=test.deep_copy_
test2[0][0]=0
p test
p test2

print "\n"

test=[[[[0]]],[3,4]]
test2=test.deep_copy
test2[0][0][0][0]=1
p test
p test2
