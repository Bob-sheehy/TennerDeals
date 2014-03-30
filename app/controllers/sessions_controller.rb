class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
  admin_user = AdminUser.find_by(name: params[:name])
  if admin_user and admin_user.authenticate(params[:password])
  session[:admin_user_id] = admin_user.id
  redirect_to home_path
  else
  redirect_to login_url, alert: "Invalid user/password combination"
 end
end

  def destroy
  session[:admin_user_id] = nil
  redirect_to home_url, notice: "Logged out"
  end
end
