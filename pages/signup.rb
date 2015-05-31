# ================================================================
# 2015/05/30 Thomas
# Purpose: To register a new user.
# Sign up using only users with email addresses of the format selenium.automation+yyyymmdd-hhmm-ssssss@gmail.com, such as saucelabs.automation+20150407-0759-173060@gmail.com
# ================================================================

require_relative FileNames::LIB_COMMON_PAGE
require_relative FileNames::LIB_MY_EMAIL


class Signup < CommonPage
	FAILURE_PAGE			= { css: '.error-text' }
	CURRENT_PAGE			= { id: 'page-signup>section>header>h1' }

	PLAN_OPTION				= { xpath: 'html/body/div[2]/div/div/div/div/section/section/form/fieldset[1]/div[1]/select[2]'}			#There are 2 select id="plan"
	FIRST_NAME_INPUT		= { id: 'name' }
	EMAIL_INPUT				= { id: 'email' }
	COMPANY_INPUT			= { id: 'company' }
	COMPANY_SIZE_OPTION		= { id: 'company-size' }
	COMPANY_PHONE_INPUT		= { id: 'phone-number' }
	USERNAME_INPUT			= { id: 'username' }
	PASSWORD_INPUT			= { id: 'password' }

	SUBMIT_BUTTON			= { id: 'submit-button' }


	#Overwrite the base_page.visit()
	def visit(url_path = "/signup")
		super
		print "@#{thing['browser']}@"
	end
	def check_page
		return is_displayed?(CURRENT_PAGE)
	end
	def success_message_present?
		account	= Account.new(@driver)
		return account.check_page
	end
	def failure_message_present?
		return is_displayed?(FAILURE_PAGE)
	end


	def fill_form(parameters = {})
		plan_option		= parameters[:plan_option] || Constants::PLAN_OPTION_DEFAULT
		first_name		= parameters[:first_name] || Constants::FIRST_NAME_DEFAULT
		email			= parameters[:email] || MyEmail.new("selenium.automation@saucelabs.com").gen_unique_email_address
		company_name	= parameters[:company_name] || "#{Constants::FIRST_NAME_DEFAULT} #{Constants::LAST_NAME_DEFAULT}"
		company_size	= parameters[:company_size] || Constants::COMPANY_SIZE_DEFAULT
		company_phone	= parameters[:company_size]
		username		= parameters[:username] || "#{Constants::FIRST_NAME_DEFAULT}_#{MyClock.get_date}-#{MyClock.micro_seconds}"	#20 character max
		password		= parameters[:password] || Constants::PASSWORD_DEFAULT

		select(PLAN_OPTION, plan_option)
		type(FIRST_NAME_INPUT, first_name)
		type(EMAIL_INPUT, email)
		type(COMPANY_INPUT, company_name)
		select(COMPANY_SIZE_OPTION, company_size)
		type(COMPANY_PHONE_INPUT, company_phone)
		clear(USERNAME_INPUT)
		type(USERNAME_INPUT, username)
		type(PASSWORD_INPUT, password)
	end
	def submit_form
		submit(SUBMIT_BUTTON)
	end
end