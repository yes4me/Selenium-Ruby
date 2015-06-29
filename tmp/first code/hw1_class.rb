# ================================================================
# 2015/03/09 Thomas 3rd program on Ruby
# Write a Ruby program that determines (and outputs) the min, max, and average of numbers stored in an ARRAY
# ================================================================

#Declare an object
class DataList
	attr_accessor :dataList			#Options: attr_accessor, attr_writer, attr_reader
	def initialize(*)	#constructor
		super
		self.dataList = Array.new	#Same as: self.dataList=[] and @dataList = Array.new
	end
	def addValue(value)
		dataList.push(value)		#Same as: dataList << value
		puts getData.inspect
		#puts getDataSorted.inspect
	end
	def deleteValue
		dataList.pop
		puts getData.inspect
	end
	# -----------------------------------------------------
	def getData
		return dataList
	end
	def getDataSorted
		return dataList.sort
	end
	def isThere(value)
		return dataList.include?(value)
	end
	def isEmpty
		return (mySize==0)? true: false
	end
	# -----------------------------------------------------
	def mySize
		return dataList.size		#dataList.size = dataList.length
	end
	def myMin
		return dataList.min
	end
	def myMax
		return dataList.max
	end
	def myAverage
		return (mySize!=0)? mySum.to_f/mySize : 0
	end
	def mySum
		return dataList.reduce :+
	end
	def myMedian
		result = getDataSorted[(mySize-1)/2] + getDataSorted[mySize/2]
		return result.to_f/2
	end
end

#Define the list
list = DataList.new		#Call initialize()
list.addValue(3)
list.addValue(2)
list.addValue(7)
list.addValue(5)

#Call methods: puts list.methods.sort
puts "List class: #{list.class}"
puts "List is empty: #{list.isEmpty}"
puts "\"7\" is included: #{list.isThere(7)}"
puts "\'9\' is included: #{list.isThere(9)}"
puts "List size: #{list.mySize}"
puts "Min value: #{list.myMin}"
puts "Max value: #{list.myMax}"
puts "Sum value: #{list.mySum}"
puts "Average value: #{list.myAverage}"
puts "Median value: #{list.myMedian}"