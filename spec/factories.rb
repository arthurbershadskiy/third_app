FactoryGirl.define do
	factory :user do
		name "Arthur"
		email "arthur@test.com"
		password "password"
		password_confirmation "password"
	end
end