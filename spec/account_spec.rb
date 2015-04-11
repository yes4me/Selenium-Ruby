# ================================================================
# 2015/03/12 Thomas
# Purpose: This rspec logon correctly and go to the different links on the left panel
# ================================================================

require_relative '../helper/spec_helper'


describe 'WorkSpaceName' do
	USEREMAIL_INPUT	= "saucelabs.automation@gmail.com"
	USERNAME_INPUT	= "sbssgm"
	PASSWORD_INPUT	= "SauceLabs2015"

	before(:each) do
		ENV['base_url'] = 'https://saucelabs.com'
		@driver		= Selenium::WebDriver.for :firefox
		@login		= Login.new(@driver)
	end
	after(:each) do
		@login.logout
		@driver.quit
	end

	it 'main page' do
		puts "RUNNING TEST: main page"

		@login.visit("/login")
		@login.authentication(USEREMAIL_INPUT, PASSWORD_INPUT)
		@login.success_message_present?.should be_true

		@account	= Account.new(@driver)
		@account.goTo_AccountHome
		#@account.goTo_Tests
		#@account.goTo_Snapshots
		#@account.goTo_Dashboard
		#@account.goTo_Subaccounts
		#@account.goTo_ActiveTunnels
		#@account.goTo_EditSettings
		#@account.goTo_BillingInfoLink
	end
end