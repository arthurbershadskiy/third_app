require 'spec_helper'

describe "Authentication Pages" do
  subject {page}
	describe "Sign in page" do
		before {visit signin_path}
		it {should have_title 'Sign in'}
		it {should have_content 'Sign in'}

		describe 'invalid user info' do
			before { click_button 'Sign in'}
			it {should have_selector('div.alert.alert-error')}

			describe 'after visiting another page' do
				before {click_link 'Home'}
				it {should_not have_selector('div.alert.alert-error')}
			end
		end

		describe 'valid info' do
			let(:user) {FactoryGirl.create(:user)}
			before do
				fill_in 'Email', with: user.email.upcase
				fill_in 'Password', with: user.password
				click_button 'Sign in'
			end
			it {should have_title(user.name)}
			it {should have_link('Profile', href: user_path(user))}
			it {should have_link('Sign out', href: signout_path)}
			it {should_not have_link('Sign in', href: signin_path)}
		end
	end

  describe "authorization" do

	  describe "for non-signed-in users" do
		  let(:user) { FactoryGirl.create(:user) }

		  describe "in the Microposts controller" do
			  describe "submitting to the create action" do
				  before { post microposts_path }
				  specify { expect(response).to redirect_to(signin_path)}
			  end
			  describe "submitting to the destroy action" do
				  before { delete micropost_path(FactoryGirl.create(:micropost))}
				  specify { expect(response).to redirect_to(signin_path)}
			  end
		  end
		  describe "when attempting to visit a protected page" do
			  before do
				  visit edit_user_path(user)
				  fill_in "Email",    with: user.email
				  fill_in "Password", with: user.password
				  click_button "Sign in"
			  end

			  describe "after signing in" do

				  it "should render the desired protected page" do
					  expect(page).to have_title('Edit user')
				  end
			  end
		  end
	  end
  end
end
