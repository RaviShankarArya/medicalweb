module Api
	module V1
		class UsersController < ApplicationController
			def create
				@user = User.new(user_params)
				if @user.valid?
					@user.build_user_profile(profile_params)
					@user.auth_token = @user.generate_auth_token
					@user.save!
					render :json => {:user => @user.as_json(:only => [:id, :user_name, :email, :phone, :address, :auth_token]).merge({:profile => @user.try(:user_profile).try(:profile_url)})}, :status => 200
				else
					render :json => {:errors => @user.errors}, :status => 422
				end
			end

			private

			def user_params
				params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :phone, :address)
			end

			def profile_params
				params.require(:user).permit(:profile)
			end
		end
	end
end