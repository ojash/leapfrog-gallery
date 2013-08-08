class Album < ActiveRecord::Base
	belongs_to :user
	has_many :photos
	validates :title, presence: true

	mount_uploader :photo, PhotoUploader
end
