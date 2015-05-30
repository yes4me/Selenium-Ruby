# ================================================================
# 2015/04/07 Thomas
# Purpose: remove redundant codes
# ================================================================

#require_relative FileNames::LIB_MY_EMAIL
require_relative FileNames::PAGES_SIGNUP_TRIAL


class SignupTrialHelper < SignupTrial
	#Optional hash parameter so that you can override one or more defaults if needed
	def test(pass, parameters = {})
		visit

		#if !(defined?(parameters[:email])).nil?
		#	parameters[:email] = MyEmail.new("selenium.automation@saucelabs.com").gen_unique_email_address
		#end

		type_user_info(parameters)
		type_company_info(parameters)
		type_authentication(parameters)
		submit_form
		if (pass==true)
			success_message_present?.should == true
		else
			failure_message_present?.should == true
		end
	end
end