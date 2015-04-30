# ================================================================
# 2015/04/16
# Purpose: Write a “happy path” signup test to register a new TRIAL user.
# Sign up using only users with email addresses of the format selenium.automation+yyyymmdd-hhmm-ssssss@gmail.com, such as saucelabs.automation+20150407-0759-173060@gmail.com
# ================================================================

require_relative FileNames::LIB_COMMON_PAGE
require_relative FileNames::LIB_MY_EMAIL


class SignUpTrial < CommonPage
	FAILURE_PAGE			= { css: '.alert.alert-error' }

	CURRENT_PAGE			= { id: 'page-signup>section>header>h1' }

	FIRST_NAME_VALUE		= Constants::FIRST_NAME_DEFAULT
	LAST_NAME_VALUE			= Constants::LAST_NAME_DEFAULT
	COMPANY_VALUE			= "#{FIRST_NAME_VALUE} #{LAST_NAME_VALUE}"
	USERNAME_VALUE			= "#{FIRST_NAME_VALUE}_#{MyClock.get_date}-#{MyClock.micro_seconds}"	#20 character max

	FIRST_NAME_INPUT		= { id: 'first_name' }
	LAST_NAME_INPUT			= { id: 'last_name' }
	EMAIL_INPUT				= { id: 'email' }
	COMPANY_INPUT			= { id: 'company' }
	COMPANY_SIZE_OPTION		= { id: 'company-size' }
	USERNAME_INPUT			= { id: 'username' }
	PASSWORD_INPUT			= { id: 'password' }
	PASSWORD_CONFIRM_INPUT	= { id: 'password_confirm' }

	SUBMIT_BUTTON			= { id: 'submit-button' }

	#Overwrite the base_page.visit()
	def visit(url = "/signup/trial")
		super
	end
	def check_page
		return is_displayed?(CURRENT_PAGE)
	end


	def type_user_info(parameters = {})
		first_name	= parameters[:first_name] || FIRST_NAME_VALUE
		last_name	= parameters[:last_name] || LAST_NAME_VALUE
		email		= parameters[:email] || MyEmail.new("selenium.automation@saucelabs.com").gen_unique_email_address

		type(FIRST_NAME_INPUT, first_name)
		type(LAST_NAME_INPUT, last_name)
		type(EMAIL_INPUT, email)
	end
	def type_company_info(parameters = {})
		company_name	= parameters[:company_name] || COMPANY_VALUE
		company_size	= parameters[:company_size] || "Just Me"

		type(COMPANY_INPUT, company_name)
		select(COMPANY_SIZE_OPTION, company_size)
	end
	def type_authentication(parameters = {})
		username			= parameters[:username] || USERNAME_VALUE
		password			= parameters[:password] || Constants::PASSWORD_DEFAULT
		password_confirm	= parameters[:password_confirm] || password

		type(USERNAME_INPUT, username)
		type(PASSWORD_INPUT, password)
		type(PASSWORD_CONFIRM_INPUT, password_confirm)
	end
	def submit_form
		submit(SUBMIT_BUTTON)
	end


	def success_message_present?
		account	= Account.new(@driver)
		return account.check_page
	end
	def failure_message_present?
		return is_displayed?(FAILURE_PAGE)
	end
end