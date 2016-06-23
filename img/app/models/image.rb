class Image < ActiveRecord::Base
  belongs_to :Users
  has_many :ImageUsers
  # Delete the image's tags when the image has been deleted
  has_many :Tags, dependent: :destroy
  has_many :Users, through: :ImageUsers
end
