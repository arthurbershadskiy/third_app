require 'spec_helper'

describe "User pages" do

	describe "signup page" do
		before { visit signup_path }

		it 'should have content "Sign up"' do
			expect(page).to have_content('Sign up')
		end
		it 'should have title Sign up' do
			expect(page).to have_title('Sign up')
		end
	end
end