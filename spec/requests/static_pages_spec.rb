require 'spec_helper'

describe "Static pages" do
	let(:base_title) {'Ruby On Rails'}
	describe "Home page" do
		before {visit root_path}
		it "should have the content 'Sample App'" do
			expect(page).to have_content('Sample App')
		end
		it 'should have the right title' do
			expect(page).to have_title("#{base_title}")
		end
		it 'should not have custom title' do
			expect(page).not_to have_title('Home')
		end
	end


	describe "Help page" do
		before {visit help_path}
		it 'should have the content "help"' do
			expect(page).to have_content('Help')
		end
		it 'should have the right title' do
			expect(page).to have_title("#{base_title} | Help")
		end
	end

	describe "About page" do
		before {visit about_path}
		it 'should have the content "About"' do
			expect(page).to have_content('About')
		end
		it 'should have the right title' do
			expect(page).to have_title("#{base_title} | About")
		end
	end

	describe "Contact page" do
		before {visit contact_path}
		it 'should have content "Contact"' do
			expect(page).to have_content('Contact me')
			expect(page).to have_title("#{base_title} | Contact")
		end
	end
end
