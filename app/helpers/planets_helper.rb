module PlanetsHelper
	
	def generate_coordinates
		coordinates = "0.0.0.0"
		unless !Planet.find_by_coordinates(coordinates)
			galaxy = rand(1..10)
			system = rand(1.. 100)
			position = rand(1..10)
			coordinates = "#{galaxy}.#{system}.#{position}"
		end
	end
	
end
