class ApplicationController < ActionController::Base
  before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  
  def authorize
      unless AdminUser.find_by(id: session[:admin_user_id])
	  redirect_to login_url, notice: "Please Log in" 
	 end
	end
  
  
  
end
