# ================================================================
# Created:	2015/04/16
# Author:	Thomas Nguyen - thomas_ejob@hotmail.com
# Purpose:	Test registration of a new TRIAL user.
# PS: Sign up using only users with email addresses of the format selenium.automation+yyyymmdd-hhmm-ssssss@gmail.com, such as saucelabs.automation+20150407-0759-173060@gmail.com
# ================================================================

require_relative FileNames::LIB_COMMON_PAGE
require_relative FileNames::LIB_MY_EMAIL


class SignupTrial < CommonPage
	LOCATOR = YAML.load_file(File.open(FileNames::LOCATORS_SIGNUPTRIAL))

	#Overwrite the base_page.visit()
	def visit(url_path = Paths::SIGNUPTRIAL)
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
		first_name			= parameters[:first_name] || Constants::FIRST_NAME_DEFAULT
		last_name			= parameters[:last_name] || Constants::LAST_NAME_DEFAULT
		email				= parameters[:email] || MyEmail.new("selenium.automation@saucelabs.com").gen_unique_email_address
		company_name		= parameters[:company_name] || "#{Constants::FIRST_NAME_DEFAULT} #{Constants::LAST_NAME_DEFAULT}"
		company_size		= parameters[:company_size] || Constants::COMPANY_SIZE_DEFAULT
		username			= parameters[:username] || "#{Constants::FIRST_NAME_DEFAULT}_#{MyClock.get_date}-#{MyClock.get_microseconds}"	#20 character max
		password			= parameters[:password] || Constants::PASSWORD_DEFAULT
		password_confirm	= parameters[:password_confirm] || password

		type(LOCATOR['FIRST_NAME_INPUT'], first_name)
		type(LOCATOR['LAST_NAME_INPUT'], last_name)
		type(LOCATOR['EMAIL_INPUT'], email)
		type(LOCATOR['COMPANY_INPUT'], company_name)
		select(LOCATOR['COMPANY_SIZE_OPTION'], company_size)
		type(LOCATOR['USERNAME_INPUT'], username)
		type(LOCATOR['PASSWORD_INPUT'], password)
		type(LOCATOR['PASSWORD_CONFIRM_INPUT'], password_confirm)
	end
	def submit_form
		submit(LOCATOR['SUBMIT_BUTTON'])
	end
end