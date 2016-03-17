class AddHtmlToAds < ActiveRecord::Migration
  def change
    add_column :ads, :html, :text
  end
end
