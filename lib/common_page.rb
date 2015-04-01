# ================================================================
# 2015/03/13 Thomas
# Purpose: set of common methods that is relevant only to https://saucelabs.com
# ================================================================

require_relative 'base_page'


class CommonPage < BasePage
	def initialize(driver)
		super(driver)
	end
	def logout
		visit("/logout")
	end
end