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
  def current_shared
    shared_image_users = ImageUser.all.map { |user| user if user.image_id == self.id }.compact
    shared_users = shared_image_users.map { |u| User.find(u.user_id) }.compact
    user = User.all.map {|u| u if u.id == self.user_id }.compact
    users_array = shared_users - user 
    users_array.map { |user| [user.name + " (" + user.email + ")", user.id]}
  end

  def available_users
    #users_array = User.all - self.user_id - [self.user_id]
    #users_array = User.all - self.users
    #current_user = current_user
    shared_image_users = ImageUser.all.map { |user| user if user.image_id == self.id }.compact
    shared_users = shared_image_users.map { |u| User.find(u.user_id) }.compact
    user = User.all.map {|u| u if u.id == self.user_id }.compact
    users_array = User.all - shared_users - user 
    #users = User.all.map { |user| user if user.id.includes? shared_users }.compact
    #users_array = ImageUser.all.map { |u| ImageUser.find(self.id) }.compact
    #@usernames = @images.map { |image| User.find(image.user_id).name }
    # Need to format here with username then email 
    users_array.map { |user| [user.name + " (" + user.email + ")", user.id]}
  end
  # 
  # Remove image file
  #
  # Check if image file is jpg
end
