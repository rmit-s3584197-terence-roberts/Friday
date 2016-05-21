class UserSessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # session[:user_id] is the syntax used to store the user's ID in the cookie!
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/main/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
