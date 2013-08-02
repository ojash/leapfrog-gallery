require_realtive '../spec_helper'

describe "User Authentication" do
	it "sign up user" do
		visit '/user/signup'
		fill_in 'Email', with: 'blab@blob.com'
		fill_in 'Password', with: 'blabla'
		click_button 'Submit'
		page.should_have_content 'Signed up!'
	end
end