class Workshop < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
end
