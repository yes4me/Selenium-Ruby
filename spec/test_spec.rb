# ================================================================
# 2015/04/19 Thomas
# Purpose: just to run any test
# ================================================================

require_relative 'spec_helper'
require_relative FileNames::PAGES_LOGIN
require_relative FileNames::HELPER_SIGNUP



describe 'Test Signup Trial' do
	COMPANY_SIZE_OPTION		= { id: 'company-size' }

	before(:each) do
		@login			= Login.new(@driver)
		@signupTrial	= SignupTrial.new(@driver)
	end
	after(:each) do
		#@login.logout
	end

	it 'positive signup' do
		print "RUNNING TEST: positive signup\n"
		@signupTrial.visit
		@signupTrial.select2(COMPANY_SIZE_OPTION, "Just Me")
	end
end