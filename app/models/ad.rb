class Ad < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 3, maximum: 30}
  validates :url, presence: true
  validates :html, presence: true
  has_attached_file :image,
  storage: :dropbox,
  dropbox_credentials: Rails.root.join("config/dropbox.yml"),
  styles: {featured:"1024x768#", medium: "300x300#", thumb: "100x100#"},    
  dropbox_options: {      
  path: proc{|style| "#{style}/#{id}_#{image.original_filename}"},  
  unique_filename: true  
  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end