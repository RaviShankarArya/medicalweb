class User < ApplicationRecord
	has_secure_password

	#Associations
	has_one :user_profile

	#Validations
	validates :user_name, :email, :phone, :address, :password, :password_confirmation, :presence => true

	validates :password,
            :format => {
              :with => ConfigCenter::User::PASSWORD_FORMAT_REG_EXP,
              :message => 'invalid password format',
              :if => proc { |user| user.password.present? }
            }
  validates :password_confirmation,
            :presence => true,
            :if => proc {|user| user.password.present? }

  validates :email,
  					:presence => true,
  					:uniqueness => true,
  					:format => {
  						:with => ConfigCenter::User::EMAIL_FORMAT_REG_EXP
  					}

  validates :phone,
  					:presence => true,
  					:format => {
  						:with => ConfigCenter::User::PHONE_FORMAT_REG_EXP
  					}

	def generate_auth_token
		SecureRandom.hex
	end
end
