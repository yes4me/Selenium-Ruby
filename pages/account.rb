# ================================================================
# 2015/03/13 Thomas
# ================================================================

require_relative '../lib/common_page'


class Account < CommonPage
	SUCCESS_MESSAGE			= { id: 'accountContainer' }

	ACCOUNT_LINK			= { xpath:	'html/body/div[1]/div[1]/div[1]/ul/li[1]/a'}
	TESTS_LINK				= { xpath:	'html/body/div[1]/div[1]/div[1]/ul/li[2]/a'}
	SNAPSHOTS_LINK			= { xpath:	'html/body/div[1]/div[1]/div[1]/ul/li[3]/a'}
	DASHBOARD_LINK			= { xpath:	'html/body/div[1]/div[1]/div[1]/ul/li[4]/a'}
	SUBACCOUNTS_LINK		= { xpath:	'html/body/div[1]/div[1]/div[1]/ul/li[5]/a'}
	ACTIVE_TUNNELS_LINK		= { xpath:	'html/body/div[1]/div[1]/div[1]/ul/li[6]/a'}
	EDIT_SETTINGS_LINK		= { xpath:	'html/body/div[1]/div[1]/div[1]/ul/li[7]/a'}
	BILLING_INFO_LINK		= { xpath:	'html/body/div[1]/div[1]/div[1]/ul/li[8]/a'}


	#These variables are created to test various pages. They should be in their own unique files. They are located here temporally
	TESTS_LABEL				= "Test"
	SNAPSHOTS_LABEL			= "Snapshots"
	DASHBOARD_LABEL			= "ACCOUNT DASHBOARD"
	SUBACCOUNTS_LABEL		= "ACCOUNT SUB-ACCOUNTS"
	ACTIVE_TUNNELS_LABEL	= "ACCOUNT ACTIVE TUNNELS"
	EDIT_SETTINGS_LABEL		= "Settings"
	BILLING_INFO_LABEL		= "Subscribe for Sauce Labs"

	ACCOUNT_LOCATOR			= { id:		'update-user-info' }
	TESTS_LOCATOR			= { css:	'#banner-box>span'}
	SNAPSHOTS_LOCATOR		= { xpath:	'html/body/div[2]/div/div/h1'}
	DASHBOARD_LOCATOR		= { css:	'.simpleH3'}
	SUBACCOUNTS_LOCATOR		= { css:	'.simpleH3'}
	ACTIVE_TUNNELS_LOCATOR	= { css:	'.simpleH3'}
	EDIT_SETTINGS_LOCATOR	= { css:	'#profile>legend'}
	BILLING_INFO_LOCATOR	= { css:	'#page-signup>section>header>h1'}


	def initialize(driver)
		#= super(driver)
		super
	end


	def success_message_present?
		#Assert: is_displayed?(SUCCESS_MESSAGE).should == true
		#Verify: is_displayed?(SUCCESS_MESSAGE)
		is_displayed?(SUCCESS_MESSAGE)
	end


	def goTo_AccountHome
		visit("/account")
		is_displayed?(ACCOUNT_LOCATOR)
	end
	def goTo_Tests
		visit("/tests")
		text_displayed?(TESTS_LOCATOR, TESTS_LABEL)
	end
	def goTo_Snapshots
		visit("/snapshots")
		text_displayed?(SNAPSHOTS_LOCATOR, SNAPSHOTS_LABEL)
	end
	def goTo_Dashboard
		visit("/account/dashboard")
		text_displayed?(DASHBOARD_LOCATOR, DASHBOARD_LABEL)
	end
	def goTo_Subaccounts
		visit("/sub-accounts")
		text_displayed?(SUBACCOUNTS_LOCATOR, SUBACCOUNTS_LABEL)
	end
	def goTo_ActiveTunnels
		visit("/tunnels")
		text_displayed?(ACTIVE_TUNNELS_LOCATOR, ACTIVE_TUNNELS_LABEL)
	end
	def goTo_EditSettings
		visit("/account/profile")
		text_displayed?(EDIT_SETTINGS_LOCATOR, EDIT_SETTINGS_LABEL)
	end
	def goTo_BillingInfoLink
		visit("/account/billing-info")
		text_displayed?(BILLING_INFO_LOCATOR, BILLING_INFO_LABEL)
	end
end