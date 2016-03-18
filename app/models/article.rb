class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10}
  has_many :article_categories
  has_many :categories, through: :article_categories
  belongs_to :user
  has_attached_file :featured, styles: { featured:"1024x768#", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png",
  dropbox_options: {
     environment: ENV["RACK_ENV"],
     path: proc{|style| "#{style}/#{id}_#{avatar.original_filename}"}
   }
  validates_attachment_content_type :featured, content_type: /\Aimage\/.*\Z/
end
