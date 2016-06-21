class Reference < ActiveRecord::Base
  
  validates :url, presence: true
  validates :topic, presence: true
  validates :annotation, presence: true

end
