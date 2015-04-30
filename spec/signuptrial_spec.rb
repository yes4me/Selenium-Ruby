# ================================================================
# 2015/04/16 Thomas
# Purpose: correctly login and go to the different links on the left panel
# ================================================================

require_relative 'spec_helper'
require_relative FileNames::PAGES_LOGIN
require_relative FileNames::PAGES_SIGNUP_TRIAL


describe 'Signup Trial' do
	before(:each) do
		@login			= Login.new(@driver)
		@signuptrial	= SignUpTrial.new(@driver)
	end
	after(:each) do
		#@login.logout
	end

	it 'positive signup' do
		print "RUNNING TEST: positive signup\n"

		@signuptrial.visit()
		@signuptrial.type_user_info()
		@signuptrial.type_company_info()
		@signuptrial.type_authentication()
		@signuptrial.submit_form()
	end
end