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

#require_relative '../lib/common_page'
require_relative 'account'


class Login < CommonPage
	FAILURE_PAGE			= { css: '.alert.alert-error' }

	USERNAME_VALUE			= ENV['username_default']
	PASSWORD_VALUE			= ENV['password_default']

	USERNAME_INPUT			= { id: 'username' }
	PASSWORD_INPUT			= { id: 'password' }
	SUBMIT_BUTTON 			= { id: 'login' }


	def check_page
		is_displayed?(USERNAME_INPUT) && is_displayed?(PASSWORD_INPUT) &&  is_displayed?(SUBMIT_BUTTON)
	end

	def authentication(username = USERNAME_VALUE, password = PASSWORD_VALUE)
		type(USERNAME_INPUT, username)
		type(PASSWORD_INPUT, password)
		submit(SUBMIT_BUTTON)
	end
	def success_message_present?
		@account	= Account.new(@driver)
		@account.check_page
	end
	def failure_message_present?
		is_displayed?(FAILURE_PAGE)
	end
end