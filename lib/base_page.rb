# ================================================================
# 2015/03/13 Thomas
# Purpose: set of methods that should universally work on all websites
# Source: http://anahorny.blogspot.in/2011/08/selenium-webdriver-ruby-tutorial.html
# ================================================================

class BasePage
	def initialize(driver)
		@driver = driver		#= super(driver)
		#@driver.manage.timeouts.implicit_wait	= 60
		#@driver.manage.timeouts.script_timeout	= 60
		#@driver.manage.timeouts.page_load		= 60
	end


	#General methods
	def visit(url_path)
		@driver.get ENV['base_url'] + url_path
	end
	def find(locator)
		return @driver.find_element(locator)
	end
	def count_elements(locator)
		return @driver.find_elements(locator).size()
	end
	def get_title
		return @driver.title
	end


	#Buttons & forms
	def clear(locator)
		find(locator).clear()
	end
	def type(locator, text)
		find(locator).send_keys(text)
	end
	def click(locator)
		find(locator).click
	end
	def select(locator, optionText)
		dropdown = find(locator)

		#This also works:
		#options = dropdown.find_elements(:tag_name => "option");
		#options.each do |g|
		#	if g.text == optionText
		#		g.click
		#		break
		#	end
		#end

		select_list = Selenium::WebDriver::Support::Select.new(dropdown)
		select_list.select_by(:text, optionText)
	end
	def submit(locator)
		find(locator).submit
	end


	#Verify
	def is_displayed?(locator)
		begin
			return find(locator).displayed?
		rescue Selenium::WebDriver::Error::NoSuchElementError
			return false
		end
	end
	def text_displayed?(locator, elementText)
		begin
			return find(locator).text.include?(elementText)
		rescue
			return false
		end
	end
	def text_present(locator)
		begin
			return find(locator).text
		rescue
			return ""
		end
	end


	#Others
	def wait_for(seconds = 15)
		Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
	end
	def wait_for(locator, seconds = 15)
		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		begin
			wait.until { find(locator) }
			return true
		rescue
			return false
		end
	end
end