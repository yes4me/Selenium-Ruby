# ================================================================
# 2015/05/30 Thomas
# Purpose: Create a “Happy Path” test to sign up a free user on https://saucelabs.com/signup
# ================================================================

require_relative 'spec_helper'
require_relative FileNames::PAGES_LOGIN
require_relative FileNames::HELPER_SIGNUP



describe 'Test Signup' do
	before(:each) do
		@signupHelper		= SignupHelper.new(@driver)
	end
	after(:each) do
		@signupHelper.logout
	end

	it 'positive signup' do
		print "RUNNING TEST: positive signup\n"
		#@signupHelper.test_form(true)
		@signupHelper.test_form(true, {:first_name => "first_name", :company_name => "company_name2"})
	end
end