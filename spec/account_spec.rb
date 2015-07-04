# ================================================================
# Created:	2015/03/12
# Author:	Thomas Nguyen - thomas_ejob@hotmail.com
# Purpose:	correctly login and go to the different links on the left panel
# ================================================================

require_relative 'spec_helper'
require_relative FileNames::PAGES_LOGIN
require_relative FileNames::PAGES_ACCOUNT


describe 'Login to account' do
	before(:each) do
		@login		= Login.new(@driver)
	end
	after(:each) do
		@login.logout
	end

	it 'main page' do
		print "RUNNING TEST: main page\n"

		@login.visit
		@login.authentication
		@login.success_message_present?.should be_true

		@account	= Account.new(@driver)
		#@account.goTo_AccountHome
		@account.goTo_Tests
		#@account.goTo_Snapshots
		#@account.goTo_Dashboard
		#@account.goTo_Subaccounts
		#@account.goTo_ActiveTunnels
		#@account.goTo_EditSettings
		#@account.goTo_BillingInfoLink
	end
end