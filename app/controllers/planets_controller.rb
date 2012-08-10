class PlanetsController < ApplicationController
	
	before_filter :signed_in_user
	
	def index
		@planets = current_user.planets
	end
	
	def new
		@planet = Planet.new
	end

	def create
		@planet = Planet.new(name: params[:planet][:name],
			coordinates: generate_coordinates,
			metal_ressource: 1000,
			user_id: current_user.id)
		if @planet.save
			flash[:success] = "Welcome on your first planet!"
			@planets = current_user.planets
  			redirect_to action: 'index'
  		else
  			flash[:error] = "Error naming your planet"
  			render 'new'
  		end
  	end

	def edit
	end

	def update
	end

	def destroy
	end
	
		
	def generate_coordinates
		coordinates = nil
		unless !coordinates.nil? && !Planet.find_by_coordinates(coordinates)
			galaxy = rand(1..10)
			system = rand(1.. 100)
			position = rand(1..10)
			coordinates = "#{galaxy}.#{system}.#{position}"
		end
	end
	
end
