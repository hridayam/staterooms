class LoginController < ApplicationController

	def login
		@users = User.all
		
	end

end