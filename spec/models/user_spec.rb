# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(255)
#  username        :string(255)
#

require 'spec_helper'

describe User do
	
	before do
		@user = User.new(username: "foobar", email: "foo@bar.com", password: "foobar", password_confirmation: "foobar")			
	end
	
	subject {@user}
	
	it {should respond_to(:username)}
	it {should respond_to(:email)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}
	it {should respond_to(:password_digest)}
	it {should respond_to(:remember_token)}
	
	it {should be_valid}
	
	describe "when username is not present" do
		before {@user.username = ""}
		it {should_not be_valid}
	end
	
	describe "when email is not present" do
		before {@user.email = ""}
		it {should_not be_valid}
	end
	
	describe "when password is not present" do
		before {@user.password = ""}
		it {should_not be_valid}
	end
	
	describe "when password confirmation is not present" do
		before {@user.password_confirmation = ""}
		it {should_not be_valid}
	end
	
	describe "remember token" do
		before {@user.save}
		its(:remember_token){should_not be_blank}
	end
	
end
