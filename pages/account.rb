# ================================================================
# 2015/03/13 Thomas
# ================================================================

require_relative FileNames::LIB_COMMON_PAGE


class Account < CommonPage
	LOCATOR = YAML.load_file(File.open(FileNames::LOCATORS_ACCOUNT))

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


	def check_page
		#Assert: is_displayed?(LOCATOR['CURRENT_PAGE']).should == true
		#Verify: is_displayed?(LOCATOR['CURRENT_PAGE'])
		return is_displayed?(LOCATOR['CURRENT_PAGE'])
	end


	def goTo_AccountHome
		visit(Paths::ACCOUNT)
		return is_displayed?(ACCOUNT_LOCATOR)
	end
	def goTo_Tests
		visit(Paths::TESTS)
		return text_displayed?(TESTS_LOCATOR, TESTS_LABEL)
	end
	def goTo_Snapshots
		visit(Paths::SNAPSHOTS)
		return text_displayed?(SNAPSHOTS_LOCATOR, SNAPSHOTS_LABEL)
	end
	def goTo_Dashboard
		visit(Paths::DASHBOARD)
		return text_displayed?(DASHBOARD_LOCATOR, DASHBOARD_LABEL)
	end
	def goTo_Subaccounts
		visit(Paths::SUBACCOUNTS)
		return text_displayed?(SUBACCOUNTS_LOCATOR, SUBACCOUNTS_LABEL)
	end
	def goTo_ActiveTunnels
		visit(Paths::TUNNELS)
		return text_displayed?(ACTIVE_TUNNELS_LOCATOR, ACTIVE_TUNNELS_LABEL)
	end
	def goTo_EditSettings
		visit(Paths::PROFILE)
		return text_displayed?(EDIT_SETTINGS_LOCATOR, EDIT_SETTINGS_LABEL)
	end
	def goTo_BillingInfoLink
		visit(Paths::BILLINGINFO)
		return text_displayed?(BILLING_INFO_LOCATOR, BILLING_INFO_LABEL)
	end
end