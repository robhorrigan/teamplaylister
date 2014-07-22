class SessionsController < ApplicationController

  def create
    @user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to user_show_path
    flash[:notice] = "You are signed in as #{@user.name}"
  end

end