# ================================================================
# 2015/04/19 Thomas
# Purpose: just to run any test
# ================================================================

require_relative 'spec_helper'
require_relative FileNames::HELPER_LOGIN
require_relative FileNames::PAGES_TEST


describe 'Work Space Name' do
	USERNAME_VALUE			= Constants::USERNAME_DEFAULT

	before(:each) do
		@login		= Login.new(@driver)
	end
	after(:each) do
		#@login.logout
	end


	it 'test' do
		@hello = Test.new.a_method
		print "-->#{@hello}<--\n"

		puts "==>#{USERNAME_VALUE}<=="
		sleep(3)
		print "==>#{USERNAME_VALUE}<=="
	end
end