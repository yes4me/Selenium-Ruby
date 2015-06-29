# ================================================================
# 2015/03/09 Thomas 2nd program on Ruby
# Write a Ruby program that determines (and outputs) the min, max, and average of numbers stored in an ARRAY
# ================================================================

array = [3,2,7,5]
sumNumber	= 0
array.each {|x|
	sumNumber	+= x
}

puts "Array size: #{array.size}"
puts "Min value: #{array.min}"
puts "Max value: #{array.max}"
puts "Average value: #{sumNumber.to_f/array.size}"
puts "Average value: #{array.reduce(:+).to_f/array.size}"
puts "Average value: #{array.instance_eval {reduce(:+).to_f/array.size} }"