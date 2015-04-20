class Product < ActiveRecord::Base
  #@products = Product.All
  mount_uploader :image, ProductImageUploader
  
  belongs_to :category, foreign_key: "category_id"
end
