# ================================================================
# 2015/03/12 Thomas
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

require_relative '../lib/common_page'


class Login < CommonPage
	LOGIN_FORM 		= { id: 'login' }
	USERNAME_INPUT	= { id: 'username' }
	PASSWORD_INPUT	= { id: 'password' }
	SUCCESS_MESSAGE	= { id: 'accountContainer' }
	FAILURE_MESSAGE	= { css: '.alert.alert-error' }

	def with(username, password)
		is_displayed?(LOGIN_FORM).should == true
		is_displayed?(USERNAME_INPUT).should == true
		is_displayed?(PASSWORD_INPUT).should == true

		type(USERNAME_INPUT, username)
		type(PASSWORD_INPUT, password)
		submit(LOGIN_FORM)
	end

	def success_message_present?
		@driver.find_element(SUCCESS_MESSAGE).displayed?
	end
	def failure_message_present?
		@driver.find_element(FAILURE_MESSAGE).displayed?
	end
end