# ================================================================
# Created:	2015/03/25
# Author:	Thomas Nguyen - thomas_ejob@hotmail.com
# Purpose:
#	Write a method named gen_unique_email_address(email) that returns the email parameter with a unique
#	plus-sign string of the format +yyyymmdd-SSSSS added onto the first half. For example, if it is called
#	with selenium.automation@saucelabs.com, it will return selenium.automation+20150324-911696@gmail.com.
#	This example indicates it was created today at 911696 microseconds past 3:24 p.m.
# ================================================================

require_relative FileNames::LIB_MY_CLOCK


class MyEmail
	def initialize(record_name)
		@record_name = record_name
	end
	def isEmail(email = @record_name)
		regex = /(.+)\@(.+)[.][A-Za-z0-9]{2,4}/
		return email.match(regex)?true:false
	end
	def gen_unique_email_address(email = @record_name)
		if isEmail
			array		= email.split(/@/)
			local_part	= array[0]
			domain_part	= array[1]

			#This way also works
			#localPart	= email.match(/(.+)\@/)[1]
			#domainPart	= email.match(/\@(.+)/)[1]

			return "#{local_part}+#{MyClock.get_date}-#{MyClock.get_microseconds}@#{domain_part}"
		end
	end
end


#EMAIL	= "selenium.automation@saucelabs.com"
#@email	= MyEmail.new(EMAIL)
#print "#{ @email.gen_unique_email_address }"