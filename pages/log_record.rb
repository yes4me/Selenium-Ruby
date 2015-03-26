# ================================================================
# 2015/03/25 Thomas
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

class LogRecord
	def initialize(recordName)
		@recordName = recordName
	end
	def isEmail(email = @recordName)
		regex = /[A-Za-z0-9_.]+@[A-Za-z0-9_]+[.][A-Za-z0-9]{2,4}/
		return regex.match(email)?true:false
	end
	def gen_unique_email_address(email = @recordName)
		if isEmail
			array		= email.split(/@/)
			localPart	= array[0]
			domainPart	= array[1]

			return "#{localPart}+#{MyClock.getDate}-#{MyClock.microSeconds}@#{domainPart}"
		end
	end
end


EMAIL	= "selenium.automation@saucelabs.com"
@log	= LogRecord.new(EMAIL)
puts "#{ @log.gen_unique_email_address }"