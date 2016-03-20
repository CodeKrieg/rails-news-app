class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10}
  has_many :article_categories
  has_many :categories, through: :article_categories
  belongs_to :user
  # attr_accessor :featured
  has_attached_file :featured,
  storage: :dropbox,
  dropbox_credentials: Rails.root.join("config/dropbox.yml"),
  styles: {full: "1366x768" ,featured:"1024x768#", medium: "300x300#", thumb: "100x100#"},    
  dropbox_options: {      
  path: proc{|style| "#{style}/#{id}_#{featured.original_filename}"},  
  unique_filename: true  
  }
  validates_attachment_content_type :featured, content_type: /\Aimage\/.*\Z/
  
end
