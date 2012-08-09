require "spec_helper"

describe "Static pages" do
	subject {page}
	before {visit root_path}
	
	describe "Home page" do
		it {should have_selector('h1', text: "Ogame-Like")}
	end
	
end