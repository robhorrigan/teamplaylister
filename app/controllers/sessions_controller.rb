class SessionsController < ApplicationController

  def create
    @user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to user_index_path
    flash[:notice] = "You did it!"
  end

end