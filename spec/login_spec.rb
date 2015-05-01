# ================================================================
# 2015/03/12 Thomas
# Purpose: check all login combinations and see if it passes/fails as expected
# ================================================================

require_relative 'spec_helper'
require_relative FileNames::HELPER_LOGIN


describe 'Test login page' do
	USERNAME_VALUE			= Constants::USERNAME_DEFAULT
	PASSWORD_VALUE			= Constants::PASSWORD_DEFAULT
	USEREMAIL_VALUE			= Constants::EMAIL_DEFAULT

	before(:each) do
		@login				= Login.new(@driver)
		@loginHelper		= LoginHelper.new(@driver)
	end
	after(:each) do
		@login.logout
	end


	it 'positive-username' do
		print "RUNNING TEST: positive-username\n"
		@loginHelper.login_test(true)
	end
	it 'positive-email' do
		print "RUNNING TEST: positive-email\n"
		@loginHelper.login_test(true, :username => USEREMAIL_VALUE)
	end
	it 'positive-blank-padded-email' do
		print "RUNNING TEST: positive-blank-padded-email\n"
		#should pass (=true), but actually fail(false) = known server bug. But we still need to check for "true"!
		@loginHelper.login_test(true, :username => " #{USEREMAIL_VALUE} ")
	end
	it 'negative-email' do
		print "RUNNING TEST: negative-email\n"
		@loginHelper.login_test(false, :username => "xxxxx@xyz.com")
	end
	it 'negative-password' do
		print "RUNNING TEST: negative-password\n"
		@loginHelper.login_test(false, :password => "xxxxx")
	end
end