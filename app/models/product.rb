class Product < ActiveRecord::Base
  #@products = Product.All
  mount_uploader :image, ProductImageUploader
end
