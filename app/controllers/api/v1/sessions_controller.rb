module Api
	module V1
		class SessionsController < ApplicationController
			def create
				@user = User.find_by_email params[:email]
				if @user && @user.authenticate(params[:password])
					@user.update_attribute(:auth_token , @user.generate_auth_token)
					render :json => {:login_response => @user.as_json(:only => [:id, :user_name, :email, :phone, :address, :auth_token]).merge({:profile => @user.try(:user_profile).try(:profile_url)})}, :status => 200
				else
					render :json => {:error => "Invalid Credentials"}, :status => 422
				end
			end
		end
	end
end