# ================================================================
# 2015/03/12 Thomas
# Purpose: check all login combinations and see if it passes/fails as expected
# ================================================================

require_relative 'spec_helper'


describe 'WorkSpaceName' do
	USEREMAIL_INPUT	= "saucelabs.automation@gmail.com"
	USERNAME_INPUT	= "sbssgm"
	PASSWORD_INPUT	= "SauceLabs2015"

	before(:each) do
		ENV['base_url'] = 'https://saucelabs.com'
		@driver = Selenium::WebDriver.for :firefox
		@login		= Login.new(@driver)
	end
	after(:each) do
		@login.logout
		@driver.quit
	end

	# ------------------------------------------------------------
	def login_test(userName, passWord, pass)
		@login.visit("/login")
		@login.authentication(userName, passWord)
		if pass
			@login.success_message_present?.should be_true
		else
			@login.failure_message_present?.should be_true
		end
	end
	# ------------------------------------------------------------

	it 'positive-email' do
		puts "RUNNING TEST: positive-email"
		login_test(USEREMAIL_INPUT, PASSWORD_INPUT, true)
	end
	it 'positive-username' do
		puts "RUNNING TEST: positive-username"
		login_test(USERNAME_INPUT, PASSWORD_INPUT, true)
	end
	it 'positive-blank-padded-email' do
		puts "RUNNING TEST: positive-blank-padded-email"
		#should pass, but actually fail = server bug
		login_test(" #{USEREMAIL_INPUT} ", PASSWORD_INPUT, true)
	end
	it 'negative-email' do
		puts "RUNNING TEST: negative-email"
		login_test("asdf@asd.com", PASSWORD_INPUT, false)
	end
	it 'negative-password' do
		puts "RUNNING TEST: negative-password"
		login_test(USEREMAIL_INPUT, "asdf", false)
	end
end