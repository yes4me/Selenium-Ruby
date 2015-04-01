# ================================================================
# 2015/03/13 Thomas
# ================================================================

require_relative 'base_page'


class CommonPage < BasePage
	def logout
		visit("/logout")
	end
end