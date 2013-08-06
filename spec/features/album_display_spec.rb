require_relative '../spec_helper'

describe "Album Display" do
	it "loggs in and gets the own albums" do
		#sign in first
		user = User.create!(
			email: 'test@blas.com',
			password: 'testblas'
		)
		visit '/users/sign_in'
		fill_in 'Email', with: 'test@blas.com'
		fill_in 'Password', with: 'testblas'
		click_button 'Sign in'

		click_link 'New Album'

		fill_in 'Title', with: 'My Album 1'
		click_button 'Create Album'

		click_link 'Back'
		click_link 'New Album'

		fill_in 'Title', with: 'My Album 2'
		click_button 'Create Album'

		click_link 'Back'
		click_link 'Sign Out'

		user = User.create!(
			email: 'test2@blas.com',
			password: 'testblas'
		)
		visit '/users/sign_in'
		fill_in 'Email', with: 'test2@blas.com'
		fill_in 'Password', with: 'testblas'
		click_button 'Sign in'

		click_link 'New Album'

		fill_in 'Title', with: 'My Album 3'
		click_button 'Create Album'

		click_link 'Back'
		click_link 'Sign Out'

		fill_in 'Email', with: 'test@blas.com'
		fill_in 'Password', with: 'testblas'
		click_button 'Sign in'

		expect(page).to have_content "Listing albums Title My Album 1 Show Edit Destroy My Album 2 Show Edit Destroy New Album Sign Out"

	end
end