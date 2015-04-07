# ================================================================
# 2015/03/25 Thomas
# Purpose:
#	Write a method named gen_unique_email_address(email) that returns the email parameter with a unique
#	plus-sign string of the format +yyyymmdd-SSSSS added onto the first half. For example, if it is called
#	with selenium.automation@saucelabs.com, it will return selenium.automation+20150324-911696@gmail.com.
#	This example indicates it was created today at 911696 microseconds past 3:24 p.m.
# ================================================================

require_relative 'my_clock'


class MyEmail
	def initialize(recordName)
		@recordName = recordName
	end
	def isEmail(email = @recordName)
		regex = /(.+)\@(.+)[.][A-Za-z0-9]{2,4}/
		return email.match(regex)?true:false
	end
	def gen_unique_email_address(email = @recordName)
		if isEmail
			array		= email.split(/@/)
			localPart	= array[0]
			domainPart	= array[1]

			#This way also works
			#localPart	= email.match(/(.+)\@/)[1]
			#domainPart	= email.match(/\@(.+)/)[1]

			return "#{localPart}+#{MyClock.getDate}-#{MyClock.microSeconds}@#{domainPart}"
		end
	end
end



EMAIL	= "selenium.automation@saucelabs.com"
@email	= MyEmail.new(EMAIL)
puts "#{ @email.gen_unique_email_address }"