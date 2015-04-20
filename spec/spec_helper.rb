# ================================================================
# 2015/03/12 Thomas 2nd program on RSpec
# This is a standard in the industry according to the book "Instant RSpec Test-Driven Development How-to" and some website
# ================================================================

require 'selenium-webdriver'


RSpec.configure do |config|
	config.before(:each) do
		@driver = Selenium::WebDriver.for :firefox
	end
	config.after(:each) do
		#@driver.quit
	end
end