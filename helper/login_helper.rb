# ================================================================
# 2015/04/07 Thomas
# Purpose: remove redundant codes
# ================================================================

require_relative FileNames::PAGES_LOGIN


class LoginHelper
	def initialize(login)
		@login = login
	end

	#Optional hash parameter so that you can override one or more defaults if needed
	def login_test(pass, parameters = {})
		@login.visit
		#@login.check_page.should be_true
		@login.authentication(parameters)
		if pass
			@login.success_message_present?.should == true
		else
			@login.failure_message_present?.should == true
		end
	end
end