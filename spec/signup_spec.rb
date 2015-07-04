# ================================================================
# Created:	2015/05/30
# Author:	Thomas Nguyen - thomas_ejob@hotmail.com
# Purpose:	Create a “Happy Path” test to sign up a free user on https://saucelabs.com/signup
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
		@signupHelper.test_form(true, {:first_name => "first_name", :company_name => "company_name2"} )
	end
	it 'negative - pre-existing email' do
		print "RUNNING TEST: negative - pre-existing email\n"
		@signupHelper.test_form(false, {:email => Constants::EMAIL_DEFAULT} )
	end
	it 'negative - pre-existing username' do
		print "RUNNING TEST: negative - pre-existing username\n"
		@signupHelper.test_form(false, {:username => Constants::USERNAME_DEFAULT} )
	end
	it 'negative - invalid character in username' do
		print "RUNNING TEST: negative - invalid character in username\n"
		@signupHelper.test_form(false, {:username => "#{Constants::USERNAME_DEFAULT}%#{Constants::USERNAME_DEFAULT}"} )
	end
	it 'negative - invalid starting character in username' do
		print "RUNNING TEST: negative - invalid starting character in username\n"
		@signupHelper.test_form(false, {:username => "%#{Constants::USERNAME_DEFAULT}"} )
	end
	it 'negative - 1-char username' do
		print "RUNNING TEST: negative - 1-char username\n"
		@signupHelper.test_form(false, {:username => "X"} )
	end
	it 'negative - 2-char username' do
		print "RUNNING TEST: negative - 2-char username\n"
		@signupHelper.test_form(false, {:username => "XX"} )
	end
	it 'negative - 21-char username' do
		print "RUNNING TEST: negative - 21-char username\n"
		@signupHelper.test_form(false, {:username => "X12345678901234567890"} )
	end
end