class AlbumMailer < ActionMailer::Base
  default from: "ojashdahal@lftechnology.com"

  def notify_user(album)
  	@user = album.user
  	@album = album
  	mail(to: @user.email, 
  		 subject: 'Album created')
  end
end
