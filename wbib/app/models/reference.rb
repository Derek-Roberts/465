class Reference < ActiveRecord::Base
  before_validation :add_http

  validates :url, presence: true
  validates :topic, presence: true
  validates :annotation, presence: true

  def add_http
    unless self.url =~ /^https?:\/\//
      self.url = "http://#{self.url}"
    end
  end

end
