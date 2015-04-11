# ================================================================
# 2015/04/07 Thomas
# Purpose: remove redundant codes
# ================================================================

require_relative '../pages/login'


class LoginHelper
	def initialize(login)
		@login = login
	end

	def login_test(userName, passWord, pass)
		@login.visit("/login")
		#@login.check_page.should be_true
		@login.authentication(userName, passWord)
		if pass
			@login.success_message_present?.should == true
		else
			@login.failure_message_present?.should == true
		end
	end
end