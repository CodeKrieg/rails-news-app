class ArticleCategory < ActiveRecord::Base
  resourcify
  belongs_to :article
  belongs_to :category
end
