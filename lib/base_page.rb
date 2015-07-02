# ================================================================
# 2015/03/13 Thomas
# Purpose: set of Selenium methods that should universally work on all websites
# Source: http://anahorny.blogspot.in/2011/08/selenium-webdriver-ruby-tutorial.html
# ================================================================

require_relative FileNames::LIB_MY_FILE

class BasePage
	def initialize(driver)
		@driver = driver		#= super(driver)
		#@driver.manage.timeouts.implicit_wait	= 60
		#@driver.manage.timeouts.script_timeout	= 60
		#@driver.manage.timeouts.page_load		= 60
	end


	#Windows
	def smart_add_url_protocol(url)
		if url =~ %r{\Awww\.}i
			url = "http://"+ url
		end
		return url
	end
	def visit(url_path)
		if (url_path != "")
			@driver.get smart_add_url_protocol(url_path)
		else
			#Error has occured. Take a screenshot
			take_screenshot()
		end
	end
	def get_title
		return @driver.title
	end
	def navigate_forward()
		@driver.navigate().forward();
	end
	def navigate_refresh()
		@driver.navigate().refresh();
	end
	def navigate_back()
		@driver.navigate().back();
	end
	def window_maximize()
		@driver.manage().window().maximize()
	end
	def window_resize(parameters = {})
		height	= parameters[:height] || Constants::WINDOW_HEIGHT_DEFAULT
		width	= parameters[:width] || Constants::WINDOW_WIDTH_DEFAULT
		@driver.manage.window.resize_to(height, width)
	end


	#Locators
	def find(locator)
		return @driver.find_element(locator)
	end
	def count_elements(locator)
		return @driver.find_elements(locator).size()
	end
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


	#Forms: input, buttons & select
	def typeNew(locator, text)
		clear(locator)
		find(locator).send_keys(text)
	end
	def type(locator, text)
		find(locator).send_keys(text)
	end
	def clear(locator)
		find(locator).clear()
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
	def click(locator, parameters = {})
		checkBox		= parameters[:check] || "null"

		if ((checkBox=="true") || (checkBox=="1"))
			locator.clear
			find(locator).click
		elsif ((checkBox=="false") || (checkBox=="0"))
			locator.clear
		else
			find(locator).click
		end
	end
	def submit(locator)
		find(locator).submit
	end


	#Other methods rarely used
	def take_screenshot(file_name = FileNames::SCREENSHOT_FILENAME)
		directory_name	= FileNames::SCREENSHOT_FOLDER
		file_name		= MyFile.new(file_name).gen_unique_file_name

		Dir.mkdir(directory_name) unless File.exists?(directory_name)
		@driver.save_screenshot(directory_name + file_name)
	end
end