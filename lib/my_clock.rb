# ================================================================
# 2015/03/25 Thomas
# Purpose:
#	required by my_email.rb
# ================================================================

class MyClock
	def self.get_date						#self = static method in Ruby
		return Time.new.strftime("%Y%m%d")
	end
	def self.get_time
		return Time.new.strftime("%H%M%S")
	end
	def self.micro_seconds					#Returns the time in number of microseconds
		return Time.new.usec
	end
end