class UserProfile < ApplicationRecord
  
  #Associations
  belongs_to :user

  mount_uploader :avatar, AvatarUploader


  

  
end
