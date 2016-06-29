class Image < ActiveRecord::Base
  #before_validation :available_users
  has_many :Users, through: :ImageUsers
  accepts_nested_attributes_for :Users

  has_and_belongs_to_many :Users
  has_many :ImageUsers

  # Delete the image's tags when the image has been deleted
  has_many :Tags, dependent: :destroy

  #def available_users
    #users_array = User.all - self.user - [self.user]
    # Need to format here with username then email 
  #end
end
