# ================================================================
# Created:	2015/05/30
# Author:	Thomas Nguyen - thomas_ejob@hotmail.com
# Purpose:	Methods for the spec file
# ================================================================

require_relative FileNames::PAGES_SIGNUP


class SignupHelper < Signup
	#Optional hash parameter so that you can override one or more defaults if needed
	def test_form(pass, parameters = {})
		visit
		fill_form(parameters)
		submit_form

		if (pass==true)
			success_message_present?.should == true
		else
			failure_message_present?.should == true
		end
	end
end