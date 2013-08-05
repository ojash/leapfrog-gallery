require_relative '../spec_helper'

describe "User Authentication" do
	it "sign up user" do
		visit '/users/sign_up'
		fill_in 'Email', with: 'blab@blob1.com'
		fill_in 'Password', with: 'someblas'
		fill_in  'Password confirmation', with: 'someblas'
		click_button 'Sign up'
		#page.should_have_content 'Signed up!'
		#save_and_open_page
		expect(page).to have_content 'Listing albums Title New Album'
	end

	xit "sign in user fails" do
		visit '/users/sign_in'
		fill_in 'Email', with: 'blab@blob.com'
		fill_in 'Password', with: 'someblas'
		click_button 'Sign in'
		#save_and_open_page
		expect(page).to have_content 'Sign in Email Password Remember me Sign upForgot your password?'
	end

	it "sign in user" do
		#user.create
		visit '/users/sign_in'
		fill_in 'Email', with: 'blab@blob.com'
		fill_in 'Password', with: 'someblas'
		click_button 'Sign in'
		#save_and_open_page
		expect(page).to have_content 'Listing albums Title New Album'
	end
end