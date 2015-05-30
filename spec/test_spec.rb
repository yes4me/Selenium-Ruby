# ================================================================
# 2015/04/19 Thomas
# Purpose: just to run any test
# ================================================================

require_relative 'spec_helper'
require_relative FileNames::PAGES_LOGIN
require_relative FileNames::HELPER_SIGNUP


<<<<<<< HEAD
=======

describe 'Test Signup Trial' do
	COMPANY_SIZE_OPTION		= { id: 'company-size' }
>>>>>>> 49bfca8ebb9486a51177a7dc7980ce2021b78b21

describe 'Test Signup Trial' do
	before(:each) do
<<<<<<< HEAD
		@login				= Login.new(@driver)
		@SignupTrialHelper	= SignupTrialHelper.new(@driver)
=======
		@login			= Login.new(@driver)
		@signupTrial	= SignupTrial.new(@driver)
>>>>>>> 49bfca8ebb9486a51177a7dc7980ce2021b78b21
	end
	after(:each) do
		#@login.logout
	end

<<<<<<< HEAD
	it 'signup1' do
		print "RUNNING TEST1\n"
		@SignupTrialHelper.test(true)
	end
	it 'signup2' do
		print "RUNNING TEST2\n"
		@SignupTrialHelper.test(true)
=======
	it 'positive signup' do
		print "RUNNING TEST: positive signup\n"
		@signupTrial.visit
		@signupTrial.select2(COMPANY_SIZE_OPTION, "Just Me")
>>>>>>> 49bfca8ebb9486a51177a7dc7980ce2021b78b21
	end
end