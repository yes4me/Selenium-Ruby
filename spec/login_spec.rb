# ================================================================
# Created:	2015/03/12
# Author:	Thomas Nguyen - thomas_ejob@hotmail.com
# Purpose:	check all login combinations and see if it passes/fails as expected
# ================================================================

require_relative 'spec_helper'
require_relative FileNames::HELPER_LOGIN


describe 'Test login page' do
	before(:each) do
		@loginHelper		= LoginHelper.new(@driver)
	end
	after(:each) do
		@loginHelper.logout
	end


	it 'positive-username' do
		print "RUNNING TEST: positive-username\n"
		@loginHelper.test(true)
	end
	it 'positive-email' do
		print "RUNNING TEST: positive-email\n"
		@loginHelper.test(true, :username => Constants::EMAIL_DEFAULT)
	end
	it 'positive-blank-padded-email' do
		print "RUNNING TEST: positive-blank-padded-email\n"
		#should pass (=true), but actually fail(false) = known server bug. But we still need to check for "true"!
		@loginHelper.test(true, :username => " #{Constants::EMAIL_DEFAULT} ")
	end
	it 'negative-email' do
		print "RUNNING TEST: negative-email\n"
		@loginHelper.test(false, :username => "xxxxx@xyz.com")
	end
	it 'negative-password' do
		print "RUNNING TEST: negative-password\n"
		@loginHelper.test(false, :password => "xxxxx")
	end
end