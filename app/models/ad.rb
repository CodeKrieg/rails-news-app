class Ad < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 3, maximum: 30}
  validates :url, presence: true
  validates :html, presence: true
  has_attached_file :image, styles: { featured:"1024x768#", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end