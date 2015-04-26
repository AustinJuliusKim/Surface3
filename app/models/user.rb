class User < ActiveRecord::Base
	attr_reader :password
	mount_uploader :image, AvatarUploader
	has_many :posts, dependent: :destroy
	before_save :format_user_input, except: [:update]

	def password=(unencrypted_password)
		unless unencrypted_password.empty?
		@password = unencrypted_password
		self.password_digest = BCrypt::Password.create(unencrypted_password)
		end
	end

	def authenticate(unencrypted_password)
		if BCrypt::Password.new(self.password_digest) == unencrypted_password
			return self
		else
			return false
		end
	end

	validates :username, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :password, presence: true, confirmation: true, length: { in: 6..20 }

	private
	def format_user_input
		self.email = self.email.downcase
	end
end
