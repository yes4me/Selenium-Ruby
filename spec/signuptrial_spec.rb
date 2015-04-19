# ================================================================
# 2015/04/16 Thomas
# Purpose: correctly login and go to the different links on the left panel
# ================================================================

require_relative 'spec_helper'
require_relative '../pages/signuptrial'


describe 'WorkSpaceName' do
	before(:each) do
		@signuptrial	= SignUpTrial.new(@driver)
	end
	after(:each) do
		@signuptrial.logout
	end

	it 'main page' do
		puts "RUNNING TEST: main page"

		@signuptrial.visit("/signup/trial")
		@signuptrial.user_info()
		@signuptrial.company_info
		@signuptrial.authentication()
		@signuptrial.submit_form
	end
end