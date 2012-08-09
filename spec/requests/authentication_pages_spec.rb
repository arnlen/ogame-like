require "spec_helper"

describe "Authentication" do
	
	subject {page}
	
	describe "when not signed in" do
		before {visit root_path}
	
		it {should have_link('Sign in', href: signin_path)}
		it {should have_link('Sign up', href: signup_path)}		
	end
	
	describe "signin page" do
		before {visit signin_path}
		
		it {should have_selector('h1', text: "Sign in")}
		
		describe "signin" do
			before {visit signin_path}
			
			describe "with invalid information" do
				before {click_button "Sign in"}
			
				it {should have_selector('h1', text: "Sign in")}
				it {should have_selector('div.alert.alert-error', text: "Invalid")}
			end		
		
			describe "with valid information" do
				let(:user){FactoryGirl.create(:user)}
				before {sign_in user}
			
				it {should have_selector('h1', text: "Head quarter")}
				it {should have_link('Sign out')}
				
				describe "followed by sign out" do
				
					before {click_link "Sign out"}
					
						it {should have_link('Sign in', href: signin_path)}
						it {should_not have_link('Sign out', href: signout_path)}
				end
			end
		end
	end

	describe "Authorization" do
		
	end
	
end