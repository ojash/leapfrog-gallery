require_relative '../spec_helper'

describe "User Signin" do
	before :each do
		User.create(:email => 'sometest@test.com', :password => 'somepass')
	end

	it "Sign in" do
		visit '/users/sign_in'
		fill_in 'Email', with: 'sometest@test.com'
		fill_in 'Password', with: 'somepass'
		click_button 'Sign in'
		#save_and_open_page
		expect(page).to have_content 'Listing albums Title New Album'
	end

	xit "duplicate user" do
		visit '/users/sign_up'
		fill_in 'Email', with: 'sometest.com'
		fill_in 'Password', with: 'someblas'
		fill_in  'Password confirmation', with: 'someblas'
		click_button 'Sign up'
		#page.should_have_content 'Signed up!'
		#save_and_open_page
		expect(page).to have_content 'Listing albums Title New Album'
	end

	it "sign in again" do
		visit '/users/sign_in'
		fill_in 'Email', with: 'blab@blob.com'
		fill_in 'Password', with: 'someblas'
		click_button 'Sign in'
		#save_and_open_page
		#expect(page).to have_content 'Listing albums Title New Album'
		visit '/users/sign_in'
		fill_in 'Email', with: 'blab@blob1.com'
		fill_in 'Password', with: 'someblas1'
		click_button 'Sign in'
		#save_and_open_page
		expect(page).to have_content 'Listing albums Title New Album'
	end
end