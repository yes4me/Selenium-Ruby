# ================================================================
# 2015/05/30 Thomas
# Purpose: remove redundant codes
# ================================================================

require_relative FileNames::PAGES_SIGNUP


class SignupHelper < Signup
	#Optional hash parameter so that you can override one or more defaults if needed
	def test(pass, parameters = {})
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