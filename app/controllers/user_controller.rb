class UserController < ApplicationController

  layout 'application'

  def index
    @properties = Property.all
  end

  def show
    @user = User.find_by_id(params[:id] || session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user_id = @user.id
    @new_user = User.find_by_id(@user.id)

    if @user.save
      flash[:notice] = 'Welcome to Friday. You are now a member of our community! Log in to start your next Friday, today!'
    else
      render("main/signup") and return
    end

    if @new_user && @new_user.authenticate(params[:password])
        # session[:user_id] is the syntax used to store the user's ID in the cookie!
        session[:user_id] = @new_user.id
         redirect_to(:controller => 'main', :action => 'index')
    else
        redirect_to '/main/login'
    end
     
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "User updated successfully"
      redirect_to(:action => 'show', :id => @user.id)
     else
      flash[:alert] = "There was a problem updating your profile."
      redirect_to :controller => 'user', :action => 'edit', :id => @user
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "User '#{user.username}' destroyed successfully"
    redirect_to(:action => 'index')
  end

  private
    def user_params
      params.require(:user).permit( :username, :password, :password_confirmation,
        :first_name, :last_name, :email, :address, :city, :country, :phone, :rating, :userpic)
    end

end
