# ================================================================
# 2015/03/12 Thomas
# ================================================================

require_relative 'spec_helper'


describe 'WorkSpaceName' do
	USERNAME_INPUT	= "saucelabs.automation@gmail.com"
	PASSWORD_INPUT	= "SauceLabs2015"

	before(:each) do
		ENV['base_url'] = 'https://saucelabs.com'
		@driver			= Selenium::WebDriver.for :firefox
		@login			= Login.new(@driver)
	end
	after(:each) do
		@login.logout
		@driver.quit
	end

	it 'main page' do
		puts "RUNNING TEST: main page"

		@login.visit("/login")
		@login.with(USERNAME_INPUT, PASSWORD_INPUT)
		@login.success_message_present?.should be_true

		@account		= Account.new(@driver)
		#@account.goTo_AccountHome
		@account.goTo_Tests
		#@account.goTo_Snapshots
		#@account.goTo_Dashboard
		#@account.goTo_Subaccounts
		#@account.goTo_ActiveTunnels
		#@account.goTo_EditSettings
		#@account.goTo_BillingInfoLink
	end
end