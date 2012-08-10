require 'spec_helper'

describe "User pages" do
	
	subject {page}
	
	describe "Sign up page" do
		before {visit signup_path}
		it {should have_selector('h1', text: "Sign up")}
	end
		
	describe "signup" do
		before {visit signup_path}
		let(:submit){"Create my account"}
		
		describe "with invalid information" do
			it "should not create a user" do
				expect{click_button submit}.not_to change(User, :count)
			end
			
			describe "after submission" do
				before {click_button submit}
				it {should have_selector('h1', text: "Sign up")}
				it {should have_selector('div#error_explanation',
				text: "The form contains")}
			end
		end
		
		describe "with valid information" do
			before do
				fill_in "Username", with: "foobar"
				fill_in "Email", with: "foo@bar.com"
				fill_in "Password", with: "foobar"
				fill_in "Confirmation", with: "foobar"				
			end
			it "should create a user" do
				expect{click_button submit}.to change(User, :count).by(1)
			end
			
			describe "after saving the user" do	
				before {click_button submit}
				let(:user){User.find_by_email("foo@bar.com")}
				
				it {should have_selector('h1', text: "First planet")}
				it {should have_link('Sign out')}
			end
		end	
	end
	
end