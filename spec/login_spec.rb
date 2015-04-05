# ================================================================
# 2015/03/12 Thomas
# Purpose: check all login combinations and see if it passes/fails as expected
# ================================================================

require_relative 'spec_helper'


describe 'WorkSpaceName' do
	USERNAME_INPUT	= "saucelabs.automation@gmail.com"
	PASSWORD_INPUT	= "SauceLabs2015"

	before(:each) do
		ENV['base_url'] = 'https://saucelabs.com'
		@driver = Selenium::WebDriver.for :firefox
		@login			= Login.new(@driver)
	end
	after(:each) do
		@login.logout
		@driver.quit
	end

	# ------------------------------------------------------------
	def loginTest(userName, passWord, pass)
		@login.visit("/login")
		@login.with(userName, passWord)
		if pass
			@login.success_message_present?.should be_true
		else
			@login.failure_message_present?.should be_true
		end
	end
	# ------------------------------------------------------------

	it 'positive-email' do
		puts "RUNNING TEST: positive-email"
		loginTest(USERNAME_INPUT, PASSWORD_INPUT, true)
	end
	it 'positive-username' do
		puts "RUNNING TEST: positive-username"
		loginTest(USERNAME_INPUT, "asdf", false)
	end
	it 'positive-blank-padded-email' do
		puts "RUNNING TEST: positive-blank-padded-email"
		#should pass, but actually fail = server bug
		loginTest(" #{USERNAME_INPUT} ", PASSWORD_INPUT, true)
	end
	it 'negative-email' do
		puts "RUNNING TEST: negative-email"
		loginTest("asdf@asd.com", PASSWORD_INPUT, false)
	end
	it 'negative-password' do
		puts "RUNNING TEST: negative-password"
		loginTest(USERNAME_INPUT, "asdf", false)
	end
end