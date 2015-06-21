# ================================================================
# 2015/05/30 Thomas
# Purpose: To register a new user.
# Sign up using only users with email addresses of the format selenium.automation+yyyymmdd-hhmm-ssssss@gmail.com, such as saucelabs.automation+20150407-0759-173060@gmail.com
# ================================================================

require_relative FileNames::LIB_COMMON_PAGE
require_relative FileNames::LIB_MY_EMAIL


class Signup < CommonPage
	LOCATOR = YAML.load_file(File.open(FileNames::LOCATORS_SIGNUP))

	#Overwrite the base_page.visit()
	def visit(url_path = Paths::SIGNUP)
		super
	end
	def check_page
		return is_displayed?(LOCATOR['CURRENT_PAGE'])
	end
	def success_message_present?
		account	= Account.new(@driver)
		return account.check_page
	end
	def failure_message_present?
		return is_displayed?(LOCATOR['FAILURE_PAGE'])
	end


	def fill_form(parameters = {})
		plan_option		= parameters[:plan_option] || Constants::PLAN_OPTION_DEFAULT
		first_name		= parameters[:first_name] || Constants::FIRST_NAME_DEFAULT
		email			= parameters[:email] || MyEmail.new("selenium.automation@saucelabs.com").gen_unique_email_address
		company_name	= parameters[:company_name] || "#{Constants::FIRST_NAME_DEFAULT} #{Constants::LAST_NAME_DEFAULT}"
		company_size	= parameters[:company_size] || Constants::COMPANY_SIZE_DEFAULT
		company_phone	= parameters[:company_phone] || Constants::COMPANY_PHONE_DEFAULT
		username		= parameters[:username] || "#{Constants::FIRST_NAME_DEFAULT}_#{MyClock.get_date}-#{MyClock.micro_seconds}"	#20 character max
		password		= parameters[:password] || Constants::PASSWORD_DEFAULT

		select(LOCATOR['PLAN_OPTION'], plan_option)
		type(LOCATOR['FIRST_NAME_INPUT'], first_name)
		type(LOCATOR['EMAIL_INPUT'], email)
		type(LOCATOR['COMPANY_INPUT'], company_name)
		select(LOCATOR['COMPANY_SIZE_OPTION'], company_size)
		type(LOCATOR['COMPANY_PHONE_INPUT'], company_phone)
		clear(LOCATOR['USERNAME_INPUT'])
		type(LOCATOR['USERNAME_INPUT'], username)
		type(LOCATOR['PASSWORD_INPUT'], password)
	end
	def submit_form
		submit(LOCATOR['SUBMIT_BUTTON'])
	end
end