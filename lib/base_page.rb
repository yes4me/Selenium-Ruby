# ================================================================
# 2015/03/13 Thomas
# Purpose: set of methods that should universally work on all websites
# ================================================================

require 'selenium-webdriver'


class BasePage
	def initialize(driver)
		@driver = driver
		@driver.manage.timeouts.implicit_wait	= 60
		@driver.manage.timeouts.script_timeout	= 60
		@driver.manage.timeouts.page_load		= 60
	end

	def visit(url_path)
		@driver.get ENV['base_url'] + url_path
	end
	def find(locator)
		return @driver.find_element(locator)
	end
	def type(locator, text)
		find(locator).send_keys(text)
	end
	def count_elements(locator)
		return @driver.find_elements(locator).size()
	end

	def submit(locator)
		find(locator).submit
	end
	def click(locator)
		find(locator).click
	end

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
	def wait_for(seconds = 15)
		Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
	end

	def get_title
		return @driver.title
	end
end