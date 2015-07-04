# ================================================================
# Created:	2015/04/07 Thomas
# Author:	Thomas Nguyen - thomas_ejob@hotmail.com
# Purpose:	Methods for the spec file
# ================================================================

require_relative FileNames::PAGES_LOGIN


class LoginHelper < Login
	#Optional hash parameter so that you can override one or more defaults if needed
	def test(pass, parameters = {})
		visit
		#@login.check_page.should be_true
		authentication(parameters)

		if pass
			success_message_present?.should == true
		else
			failure_message_present?.should == true
		end
	end
end