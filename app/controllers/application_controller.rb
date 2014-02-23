class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def layout_vars
		session[:user_id] = 1
		@logged_data = logged_data
	end
	
	def logged_data
		Hero.find_by_id(session[:user_id])
	end
end
