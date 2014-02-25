class DashboardController < ApplicationController

	before_filter :authenticate_user!

	def index
		@profile= current_user.profile
		@bulletin = current_user.my_bulletin
	end

end
