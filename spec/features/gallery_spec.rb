require_relative '../spec_helper'

describe "Album Ownership" do
	it "logged in user can create gallery" do
		user = User.create!(
			email: 'test@blas.com',
			password: 'testblas'
		)
		user2 = User.create!(
			email: 'test2@blas.com',
			password: 'testblas'
		)
		visit '/users/sign_in'
		fill_in 'Email', with: 'test@blas.com'
		fill_in 'Password', with: 'testblas'
		click_button 'Sign in'

		#visit new_album_path # '/albums/new'
		#save_and_open_page
		click_link 'New Album'

		fill_in 'Title', with: 'My Album'
		click_button 'Create Album'

		expect(Album.last.title).to eql('My Album')
		expect(Album.last.user).to eql(user)
		expect(Album.last.user).not_to eql(user2)
	end

	it "title cannot be blank" do
		user = User.create!(
			email: 'test@blas.com',
			password: 'testblas'
		)
		
		visit '/users/sign_in'
		fill_in 'Email', with: 'test@blas.com'
		fill_in 'Password', with: 'testblas'
		click_button 'Sign in'

		#visit new_album_path # '/albums/new'
		#save_and_open_page
		click_link 'New Album'

		fill_in 'Title', with: ''
		click_button 'Create Album'
	end
end