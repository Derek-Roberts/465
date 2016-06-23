class Image < ActiveRecord::Base
  has_many :ImageUsers
  # Delete the image's tags when the image has been deleted
  has_many :Tags, dependent: :destroy
end
