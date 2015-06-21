# ================================================================
# 2015/03/09 Thomas 4th program on Ruby
# Write a Ruby program that determines (and outputs) the min, max, and average of numbers stored in an ARRAY
# ================================================================

#Declare an object
class DataHash
	attr_accessor :dataHash
	def initialize(*)	#constructor
		super
		self.dataHash	= Hash.new
	end
	def addValue(value)
		dataHash[mySize] = value			#same as @dataHash[@counter] = value
		puts getData.inspect
	end
	def deleteIndex(index = mySize-1)
		if (index.to_s == index.to_i.to_s) && (index>=0) && (index<mySize)
			dataHash.delete(index)
			print "DELETE index #{index}:"
			puts getData.inspect
		else
			puts "Error: Index \"#{index}\" must be a number"
		end
	end
	def deleteValues(valueToDelete)
		dataHash.delete_if{ |key,value| value == valueToDelete}
		puts getData.inspect
	end
	# -----------------------------------------------------
	def getData
		return dataHash.inspect
	end
	def getDataSorted
		return dataHash.sort_by { |key,value| value}.inspect
	end
	def isThereValue(valueToSearch)
		result = false
		dataHash.each do |key,value|
			result=true if (value==valueToSearch)
		end
		return result
	end
	def isEmpty
		return (mySize==0)? true: false
	end
	# -----------------------------------------------------
	def mySize
		return dataHash.size		#dataHash.size = dataHash.length
	end
	def myMinValue
		return dataHash.values.min
	end
	def myMaxValue
		return dataHash.values.max
	end
	def myAverageValue
		return (mySize!=0)? mySumValue.to_f/mySize : 0
	end
	def mySumValue
		return dataHash.values.reduce :+
	end
	def myMedian
		dataList= dataHash.values.sort
		result	= dataList[(mySize-1)/2] + dataList[mySize/2]
		return result.to_f/2
	end
end

#Define the list
list = DataHash.new		#Call initialize()
list.addValue(3)
list.addValue(2)
list.addValue(7)
list.addValue(5)

#Call methods: puts list.methods.sort
puts "List class: #{list.class}"
puts "List is empty: #{list.isEmpty}"
puts "\"7\" is included: #{list.isThereValue(7)}"
puts "\'9\' is included: #{list.isThereValue(9)}"
puts "List size: #{list.mySize}"
puts "Min value: #{list.myMinValue}"
puts "Max value: #{list.myMaxValue}"
puts "Sum value: #{list.mySumValue}"
puts "Average value: #{list.myAverageValue}"
puts "Median value: #{list.myMedian}"