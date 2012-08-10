require "spec_helper"

describe "Authentication" do
	
	subject {page}
	
	describe "when not signed in" do
		before {visit root_path}
		it {should have_selector('h1', text: "Ogame-Like")}
		it {should have_link('Sign in', href: signin_path)}
		it {should_not have_link('Sign out', href: signout_path)}		
	end
		
	describe "signin page" do
		before {visit signin_path}
		it {should have_selector('h1', text: "Sign in")}
		
		describe "signin" do
		
			describe "with invalid information" do
				before {click_button "Sign in"}
				it {should have_selector('h1', text: "Sign in")}
				it {should have_selector('div.alert.alert-error',
				text: "Invalid")}
			end		
		
			describe "with valid information" do
				let(:user){FactoryGirl.create(:user)}
				before do
					fill_in "Email", with: user.email
					fill_in "Password", with: user.password
					click_button "Sign in"			
				end
			
				it {should have_selector('h1',
				text: "Welcome #{user.username}")}
				it {should have_link('show planets', href: planets_path)}
				it {should have_link('Sign out', href: signout_path)}
				it {should_not have_link('Sign in', href: signin_path)}
				
				describe "followed by sign out" do
					before {click_link "Sign out"}
						it {should have_link('Sign in',
						href: signin_path)}
						it {should_not have_link('Sign out',
						href: signout_path)}
				end
			end
		end
	end

	describe "Authorization" do
		let(:user){FactoryGirl.create(:user)}
		
		describe "for non-signed-in users" do
			
			describe "in the planets controller" do
				let(:planet){FactoryGirl.create(:planet)}
				
				describe "when visiting the index page" do
					before {visit planets_path}
					it {should have_selector('h1', text: "Sign in")}
				end
				
				describe "when visiting the new planet page" do
					before {visit new_planet_path}
					it {should have_selector('h1', text: "Sign in")}
				end
				
				describe "when submitting to the create action" do
					before {post planets_path(planet)}
					specify {response.should redirect_to(signin_path)}		
				end
				
				describe "when visiting the edit planet page" do
					before {visit edit_planet_path(planet)}
					it {should have_selector('h1', text: "Sign in")}
				end
				
				describe "when submitting to the update action" do
					before {put planet_path(planet)}
					specify {response.should redirect_to(signin_path)}
				end
				
				describe "when submitting to the destroy action" do
					before {delete planet_path(planet)}
					specify {response.should redirect_to(signin_path)}
				end
				
			end
			
			describe "in the users controller" do
				
				describe "when visiting the index page" do
					before {visit users_path}
					it {should have_selector('h1', text: "Sign in")}
				end
										
				describe "when visiting the edit user page" do
					before {visit edit_user_path(user)}
					it {should have_selector('h1', text: "Sign in")}
				end
				
				describe "when submitting to the update action" do
					before {put user_path(user)}
					specify {response.should redirect_to(signin_path)}
				end
				
				describe "when submitting to the destroy action" do
					before {delete user_path(user)}
					specify {response.should redirect_to(signin_path)}
				end
				
			end
			
		end
		
		describe "for signed-in users" do
		end
	end
	
end