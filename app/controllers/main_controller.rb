class MainController < ApplicationController

  layout "public" 
  
  def index
  end

  def show_all
    @properties = Property.all
  end

  def show
    @property = Property.find_by_id(params[:id])
  end

  def signup
    @user = User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Friday. You're now part of our community!"
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to(:controller => 'user', :action => 'show', :id => @user.id)
    else
      render('signup')
    end
  end

  def login

  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in. Welcome back to Friday."
      redirect_to(:controller => 'user', :action => 'show')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
      session[:user_id] = nil
      session[:username] = nil
      flash[:notice] = "Logged out"
      redirect_to(:action => 'login')
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_digest, :first_name, :last_name, :email,
        :address, :city, :country, :phone)
    end
end

