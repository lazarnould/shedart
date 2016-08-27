class Image < ActiveRecord::Base
  belongs_to :workshop

  mount_uploader :photo, PhotoUploader
end
