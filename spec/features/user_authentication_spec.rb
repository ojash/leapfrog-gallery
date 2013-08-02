require_relative '../spec_helper'

describe "User Authentication" do
	it "sign up user" do
		visit '/users/sign_up'
		fill_in 'Email', with: 'blab@blob.com'
		fill_in 'Password', with: 'someblas'
		fill_in  'Password confirmation', with: 'someblas'
		click_button 'Sign up'
		#page.should_have_content 'Signed up!'
		save_and_open_page
		expect(page).to have_content 'Listing albums Title New Album'
	end
end