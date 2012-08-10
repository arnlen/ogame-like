FactoryGirl.define do

	factory :user do
		
		username "foobar"
		email "foo@bar.com"
		password "foobar"
		password_confirmation "foobar"
		
	end
	
	factory :planet do
	
		sequence(:name){|n| "Planet-#{n}"}
		sequence(:coordinates){|n| "0.0.0.#{n}"}
		metal_ressource 1000
		user_id 1
	end

end