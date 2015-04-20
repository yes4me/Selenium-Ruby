# ================================================================
# 2015/04/19 Thomas
# Purpose: just to run any test
# ================================================================

require_relative 'spec_helper'
require_relative '../helper/login_helper'
require_relative '../lib/my_clock'


describe 'WorkSpaceName' do
	before(:each) do
		#@login		= Login.new(@driver)
	end
	after(:each) do
		#@login.logout
	end


	it 'test' do
		tmp = "#{MyClock.get_date}-#{MyClock.micro_seconds}"
		puts "tmp=#{tmp}"
	end
end