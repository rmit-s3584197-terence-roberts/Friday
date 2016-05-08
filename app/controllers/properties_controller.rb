class PropertiesController < ApplicationController

  layout 'application'
  before_filter :authorize

  def index
    @properties = Property.all.where(user_id: params[:user_id])
    @owner_id = params[:user_id]
  end

  def show
    @property = Property.find_by_id(params[:id])
  end

  def browseshow
    @properties = Property.find_by_id(params[:id])
  end

  def show_all
    @properties = Property.all
  end

  def new
    @user = User.find_by_id(params[:id])
    @properties = Property.new
  end

  def create

    @property = Property.new(property_params)

    if @property.save
      flash[:notice] = "Property created successfully"
      redirect_to :action => 'show', :id => @property.id
    else
      render('new')
    end
  end


  def edit
    @property = Property.find_by_id(params[:id])
  end

  def update
    @property = Property.find_by_id(params[:id])

    if @property.update_attributes(property_params)
      flash[:notice] = "Property updated successfully"
      redirect_to(:action => 'show', :id => @property.id)
    else
      render('edit')
    end
  end

  def delete
    @property = Property.find(params[:id])
    @owner_id = @property.user_id
  end

  def destroy
    property = Property.find(params[:id]).destroy
    flash[:notice]="Propery '#{property.name}' destroyed successfully!"
    redirect_to(:action => 'index')
  end

  private
    def property_params
      params.require(:property).permit(:name, :user_id, :address, :city, :country, 
      	:num_rooms, :ac_available, :pool_available, :num_points, :discount, :photo)
    end


end
