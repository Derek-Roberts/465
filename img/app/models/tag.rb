class Tag < ActiveRecord::Base
  validates :str, presence: true
  belongs_to :Image
end
