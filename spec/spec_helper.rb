# ================================================================
# Created:	2015/03/12
# Author:	Thomas Nguyen - thomas_ejob@hotmail.com
# Purpose:	This is a standard in the industry according to the book "Instant RSpec Test-Driven Development How-to" and some website
# ================================================================

require 'selenium-webdriver'
require_relative '../config/constants'
require_relative '../config/filenames'
require_relative '../config/paths'


RSpec.configure do |config|
	config.include Constants
	config.include FileNames
	config.include Paths

	config.before(:each) do
		case ENV['browser']
		when 'firefox'
			@driver = Selenium::WebDriver.for :firefox
		when 'chrome'
			Selenium::WebDriver::Chrome::Service.executable_path = File.join(Dir.pwd, 'vendor/chromedriver')
			@driver = Selenium::WebDriver.for :chrome
		end
	end
	config.after(:each) do
		#@driver.quit
	end
end