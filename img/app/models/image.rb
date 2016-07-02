class Image < ActiveRecord::Base
  #before_validation :available_users
  
  has_many :image_users
  has_many :users, through: :image_users
  belongs_to :users
  accepts_nested_attributes_for :users

  # Delete the image's tags when the image has been deleted
  has_many :tags, dependent: :destroy

  def current_shared
    shared_image_users = ImageUser.all.map { |user| user if user.image_id == self.id }.compact
    users_array = shared_image_users.map { |u| [User.find(u.user_id), u.id] }.compact
    users_array.map { |user| [user.first.name + " (" + user.first.email + ")", user.first.id, user.last]}
  end

  def available_users
    shared_image_users = ImageUser.all.map { |user| user if user.image_id == self.id }.compact
    shared_users = shared_image_users.map { |u| User.find(u.user_id) }.compact
    user = User.all.map {|u| u if u.id == self.user_id }.compact
    users_array = User.all - shared_users - user 
    # Need to format here with username then email 
    users_array.map { |user| [user.name + " (" + user.email + ")", user.id]}
  end
  # 
  # Remove image file
  #
  # Check if image file is jpg
end
