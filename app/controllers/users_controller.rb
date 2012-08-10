class UsersController < ApplicationController
	
	before_filter :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
	
  def index
  end
  
  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		sign_in @user
  		redirect_to new_planet_path
  	else
  		render 'new'
  	end
  			
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
