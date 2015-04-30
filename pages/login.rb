# ================================================================
# 2015/03/12 Thomas notes
	#Does work in Ruby:
		#@driver.find_element(id: 'login').displayed?.should == true
		#@driver.find_element(id: "login").displayed?.should == true
		#@driver.find_element(name:'login-form').displayed?.should == true
		#@driver.find_element(class:'login-links').displayed?.should == true
		#@driver.find_element(xpath:'html/body/div[2]/div/div/section/div/form/fieldset/div[1]/input').displayed?.should == true
		#@driver.find_element(xpath:'//section/div/form/fieldset/div[1]/input').displayed?.should == true
	#Does not work in Ruby:
		#@driver.find_element(tagName:'div').displayed?.should == true
		#@driver.find_element(linkText:'Features').displayed?.should == true
		#@driver.find_element(partialLinkText:'Features').displayed?.should == true
		#a[id='hrefID23'][name='hrefName23']
		#@driver.find_element(cssSelector:"").displayed?.should == true
# ================================================================

#require_relative FileNames::LIB_COMMON_PAGE
require_relative FileNames::PAGES_ACCOUNT


class Login < CommonPage
	FAILURE_PAGE		= { css: '.alert.alert-error' }

	USERNAME_INPUT		= { id: 'username' }
	PASSWORD_INPUT		= { id: 'password' }
	SUBMIT_BUTTON		= { id: 'login' }


	#Overwrite the base_page.visit()
	def visit(url_path = "/login")
		super
	end
	def check_page
		return is_displayed?(USERNAME_INPUT) && is_displayed?(PASSWORD_INPUT) &&  is_displayed?(SUBMIT_BUTTON)
	end


	def authentication(parameters = {})
		username	= parameters[:username] || Constants::USERNAME_DEFAULT
		password	= parameters[:password] || Constants::PASSWORD_DEFAULT

		type(USERNAME_INPUT, username)
		type(PASSWORD_INPUT, password)
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