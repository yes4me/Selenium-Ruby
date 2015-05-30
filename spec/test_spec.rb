# ================================================================
# 2015/04/19 Thomas
# Purpose: just to run any test
# ================================================================

require_relative 'spec_helper'
require_relative FileNames::PAGES_LOGIN
require_relative FileNames::HELPER_SIGNUP



describe 'Test Signup Trial' do
	before(:each) do
		@login				= Login.new(@driver)
		@SignupTrialHelper	= SignupTrialHelper.new(@driver)
	end
	after(:each) do
		#@login.logout
	end

	it 'signup1' do
		print "RUNNING TEST1\n"
		@SignupTrialHelper.test(true)
	end
	it 'signup2' do
		print "RUNNING TEST2\n"
		@SignupTrialHelper.test(true)
	end
end