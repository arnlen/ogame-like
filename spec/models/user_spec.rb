require 'spec_helper'

describe User do
	
	before do
		@user = User.new(email: "foo@bar.com", password: "foobar", password_confirmation: "foobar")			
	end
	
	subject {@user}
	
	it {should respond_to(:email)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}
	it {should respond_to(:password_digest)}
	
	it {should be_valid}
end