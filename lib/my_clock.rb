# ================================================================
# Created:	2015/03/25
# Author:	Thomas Nguyen - thomas_ejob@hotmail.com
# Purpose:	Generic time related methods
# ================================================================

class MyClock
	def self.get_date						#self = static method in Ruby
		return Time.new.strftime("%Y%m%d")
	end
	def self.get_time
		return Time.new.strftime("%H%M%S")
	end
	def self.get_microseconds					#Returns the time in number of microseconds
		return Time.new.usec
	end
end