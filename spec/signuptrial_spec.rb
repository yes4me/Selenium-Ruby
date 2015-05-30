# ================================================================
# 2015/04/16 Thomas
# Purpose: Create a “Happy Path” test to sign up a free user on https://saucelabs.com/signup/trial
# ================================================================

require_relative 'spec_helper'
require_relative FileNames::PAGES_LOGIN
require_relative FileNames::HELPER_SIGNUPTRIAL



describe 'Test Signup Trial' do
	before(:each) do
		@login				= Login.new(@driver)
		@signupTrialHelper	= SignupTrialHelper.new(@driver)
	end
	after(:each) do
		#@login.logout
	end

	it 'positive signup' do
		print "RUNNING TEST: positive signup\n"
		@signupTrialHelper.test(true)
	end
	it 'negative - pre-existing email' do
		print "RUNNING TEST: negative - pre-existing email\n"
		@signupTrialHelper.test(false, :email => Constants::EMAIL_DEFAULT)
	end
	it 'negative - pre-existing username' do
		print "RUNNING TEST: negative - pre-existing username\n"
		@signupTrialHelper.test(false, :username => Constants::USERNAME_DEFAULT)
	end
	it 'negative - invalid character in username' do
		print "RUNNING TEST: negative - invalid character in username\n"
		@signupTrialHelper.test(false, :username => "#{Constants::USERNAME_DEFAULT}%#{Constants::USERNAME_DEFAULT}")
	end
	it 'negative - invalid starting character in username' do
		print "RUNNING TEST: negative - invalid starting character in username\n"
		@signupTrialHelper.test(false, :username => "%#{Constants::USERNAME_DEFAULT}")
	end
	it 'negative - 1-char username' do
		print "RUNNING TEST: negative - 1-char username\n"
		@signupTrialHelper.test(false, :username => "X")
	end
	it 'negative - 2-char username' do
		print "RUNNING TEST: negative - 2-char username\n"
		@signupTrialHelper.test(false, :username => "XX")
	end
	it 'negative - 21-char username' do
		print "RUNNING TEST: negative - 21-char username\n"
		@signupTrialHelper.test(false, :username => "X12345678901234567890")
	end
end