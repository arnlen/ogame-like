class UsersController < ApplicationController
	
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
  		flash[:success] = "Welcome to your brand new Head Quarter Amiral!"
  		redirect_to @user
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
