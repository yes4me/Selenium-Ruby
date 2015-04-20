# ================================================================
# 2015/04/16
# Purpose: Write a “happy path” signup test to register a new TRIAL user.
# Sign up using only users with email addresses of the format selenium.automation+yyyymmdd-hhmm-ssssss@gmail.com, such as saucelabs.automation+20150407-0759-173060@gmail.com
# ================================================================

require_relative '../lib/common_page'
require_relative '../lib/my_email'


class SignUpTrial < CommonPage
	CURRENT_PAGE			= { id: 'page-signup>section>header>h1' }

	FIRST_NAME_VALUE		= "John"
	LAST_NAME_VALUE			= "Doe"
	EMAIL_VALUE				= MyEmail.new("selenium.automation@saucelabs.com").gen_unique_email_address
	COMPANY_VALUE			= "#{FIRST_NAME_VALUE} #{LAST_NAME_VALUE}"
	COMPANY_SIZE_VALUE		= "Just Me"
	USERNAME_VALUE			= "#{FIRST_NAME_VALUE}_#{MyClock.get_date}-#{MyClock.micro_seconds}"	#20 character max
	PASSWORD_VALUE			= ENV['password_default']

	FIRST_NAME_INPUT		= { id: 'first_name' }
	LAST_NAME_INPUT			= { id: 'last_name' }
	EMAIL_INPUT				= { id: 'email' }
	COMPANY_INPUT			= { id: 'company' }
	COMPANY_SIZE_OPTION		= { id: 'company-size' }
	USERNAME_INPUT			= { id: 'username' }
	PASSWORD_INPUT			= { id: 'password' }
	PASSWORD_CONFIRM_INPUT	= { id: 'password_confirm' }

	SUBMIT_BUTTON			= { id: 'submit-button' }


	def check_page
		is_displayed?(CURRENT_PAGE)
	end

	def user_info(firstName = FIRST_NAME_VALUE, lastName = LAST_NAME_VALUE, email = EMAIL_VALUE)
		type(FIRST_NAME_INPUT, firstName)
		type(LAST_NAME_INPUT, lastName)
		type(EMAIL_INPUT, email)
	end
	def company_info(company = COMPANY_VALUE, company_size = COMPANY_SIZE_VALUE)
		type(COMPANY_INPUT, company)
		puts "==>#{company_size}"
		select(COMPANY_SIZE_OPTION, company_size)
	end
	def authentication(username = USERNAME_VALUE, password = PASSWORD_VALUE)
		type(USERNAME_INPUT, username)
		type(PASSWORD_INPUT, password)
		type(PASSWORD_CONFIRM_INPUT, password)
	end
	def submit_form
		submit(SUBMIT_BUTTON)
	end
end