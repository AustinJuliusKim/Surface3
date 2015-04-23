class User < ActiveRecord::Base
	mount_uploader :image, AvatarUploader
	has_many :posts
end
