# ================================================================
# Created:	2015/06/29
# Author:	Thomas Nguyen - thomas_ejob@hotmail.com
# Purpose:
#	Write a method named gen_unique_file_name that returns a unique file name of the format +yyyymmdd-SSSSS added onto the first half.
# 	For example, if it will return screen_+20150324-911696.png
#	This example indicates it was created today at 911696 microseconds past 3:24 p.m.
# ================================================================

require_relative FileNames::LIB_MY_CLOCK


class MyFile
	def initialize(file_name)
		@file_name = file_name
	end
	def isfile_name(file_name = @file_name)
		regex = /(.+)\.[A-Za-z]{1,4}/
		return file_name.match(regex)?true:false
	end
	def get_file_name(file_name = @file_name)
		return File.basename(file_name)
	end
	def get_folder_name(file_name = @file_name)
		return File.dirname(file_name)
	end
	def gen_unique_file_name(file_name = @file_name)
		if isfile_name
			file	= file_name.match(/(.+)\.(.+)/)[1]
			type	= file_name.match(/(.+)\.(.+)/)[2]
			return "#{file}+#{MyClock.get_date}-#{MyClock.get_microseconds}.#{type}"
		end
	end
end


#SCREENSHOT_file_name = "../screenshot/screen.png"
#@file_name	= Myfile_name.new(SCREENSHOT_file_name)
#print "#{ @file_name.gen_unique_file_name }"