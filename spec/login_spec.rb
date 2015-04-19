# ================================================================
# 2015/03/12 Thomas
# Purpose: check all login combinations and see if it passes/fails as expected
# ================================================================

require_relative 'spec_helper'
require_relative '../helper/login_helper'


describe 'WorkSpaceName' do
	USEREMAIL_INPUT			= "saucelabs.automation@gmail.com"
	USERNAME_DEFAULT		= "sbssgm"
	PASSWORD_DEFAULT		= "SauceLabs2015"

	before(:each) do
		@login		= Login.new(@driver)
		@loginHelper= LoginHelper.new(@login)
	end
	after(:each) do
		@login.logout
	end


	it 'positive-email' do
		puts "RUNNING TEST: positive-email"
		@loginHelper.login_test(USEREMAIL_INPUT, PASSWORD_DEFAULT, true)
	end
	it 'positive-username' do
		puts "RUNNING TEST: positive-username"
		@loginHelper.login_test(USERNAME_DEFAULT, PASSWORD_DEFAULT, true)
	end
	it 'positive-blank-padded-email' do
		puts "RUNNING TEST: positive-blank-padded-email"
		#should pass (=true), but actually fail(false) = known server bug. But we still need to check for "true"!
		@loginHelper.login_test(" #{USEREMAIL_INPUT} ", PASSWORD_DEFAULT, true)
	end
	it 'negative-email' do
		puts "RUNNING TEST: negative-email"
		@loginHelper.login_test("asdf@asd.com", PASSWORD_DEFAULT, false)
	end
	it 'negative-password' do
		puts "RUNNING TEST: negative-password"
		@loginHelper.login_test(USEREMAIL_INPUT, "asdf", false)
	end
end