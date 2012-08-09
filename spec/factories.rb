FactoryGirl.define do

	factory :user do
		email "foo@bar.com"
		password "foobar"
		password_confirmation "foobar"
	end

end