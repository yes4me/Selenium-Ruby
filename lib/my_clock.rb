# ================================================================
# 2015/03/25 Thomas
# Purpose:
#	required by my_email.rb
# ================================================================

class MyClock
	def self.getDate						#self = static method in Ruby
		return Time.new.strftime("%Y%m%d")
	end
	def self.getTime
		return Time.new.strftime("%H%M%S")
	end
	def self.microSeconds					#Returns the number of microseconds for time
		return Time.new.usec
	end
end