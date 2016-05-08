class UserController < ApplicationController

  layout 'application'

  def index
    @properties = Property.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Welcome to Friday. You are now a member of our community!'
      redirect_to(:controller => 'user', :action => 'index')
    else
      render("new")
    end
  end

  def show
    @user = User.find_by_id(params[:id] || session[:user_id])
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
      render('edit')
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
        :first_name, :last_name, :email, :address, :city, :country, :phone)
    end

end

