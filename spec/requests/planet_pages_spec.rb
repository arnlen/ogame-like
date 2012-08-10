require 'spec_helper'

describe 'Planet pages' do

	let(:user){FactoryGirl.create(:user)}
	before {sign_in user}
	
	subject {page}
	
	describe "index planetes page" do
		
	end
	
	describe "new planet page" do
		before {visit new_planet_path}
		it {should have_selector('h1', text: "First planet")}		
		
		describe "with invalid information" do
			before {click_button "Validate"}
			it {should have_selector('h1', text: "First planet")}
			it {should have_selector('div.alert-error',
				text: "The form contains")}
		end
		
		describe "with valid information" do
			before do
				visit new_planet_path
				fill_in "Name", with: "ProximaDuLOL"
				click_button "Validate"
			end
			
			it {should have_selector('div.alert.alert-success',
				text: "Welcome")}
			it {should have_selector('h1', text: "Planet")}
		end
	end

end