# ================================================================
# 2015/03/13 Thomas
# Purpose: set of common methods that is relevant only to https://saucelabs.com
# ================================================================

require 'yaml'
require_relative FileNames::LIB_BASE_PAGE


class CommonPage < BasePage
	def initialize(driver)
		super
	end
	def logout
		visit(Paths::LOGOUT)
	end
end