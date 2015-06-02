# ================================================================
# 2015/04/19 Thomas
# Purpose: just to run any test
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
		@loginHelper.test(true)
	end
end