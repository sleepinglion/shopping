class UserPicture < ApplicationRecord
  belongs_to :user, autosave: true
  mount_uploader :picture, UserPictureUploader
end
