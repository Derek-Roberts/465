class Image < ActiveRecord::Base
  #before_validation :available_users
  has_many :image_users
  has_many :users, through: :image_users
  belongs_to :users
  accepts_nested_attributes_for :users

  # Delete the image's tags when the image has been deleted
  has_many :tags, dependent: :destroy

  # elsif self.user_id == user_id
  #   return true
  # elsif self.image_users.map (|im| im.user_id).index user_id
  #   return true
  # end
  # return false

  #def available_users
    #users_array = User.all - self.user - [self.user]
    # Need to format here with username then email 
  #end
  # 
  # Remove image file
  #
  # Check if image file is jpg
end
