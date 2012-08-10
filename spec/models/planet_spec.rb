require 'spec_helper'

describe Planet do
	
	before {@planet = Planet.new(name: "Proxima", coordinates: "0.0.0.0", metal_ressource: 1000, user_id: 1)}
	
	subject {@planet}
	
	it {should respond_to(:name)}
	it {should respond_to(:coordinates)}
	it {should respond_to(:metal_ressource)}
	it {should respond_to(:user_id)}
	
	it {should be_valid}
	
	describe "when name is not present" do
		before {@planet.name = ""}
		it {should_not be_valid}
	end
	
	describe "when coordinates is not present" do
		before {@planet.coordinates = ""}
		it {should_not be_valid}
	end
	
	describe "when metal_ressource is not present" do
		before {@planet.metal_ressource = ""}
		it {should be_valid}
	end
	
	describe "when user_id is not present" do
		before {@planet.user_id = ""}
		it {should_not be_valid}
	end
end
