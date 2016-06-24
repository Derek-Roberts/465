class Image < ActiveRecord::Base
  before_validation :available_users

  belongs_to :Users
  has_many :ImageUsers

  # Delete the image's tags when the image has been deleted
  has_many :Tags, dependent: :destroy
  has_many :Users, through: :ImageUsers

  def available_users
    users_array = User.all - self.users - [self.user]
    # Need to format here with username then email
    
  end
end
