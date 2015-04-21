class Product < ActiveRecord::Base
  #@products = Product.All
  mount_uploader :image, ProductImageUploader
  
  belongs_to :category, foreign_key: "category_id"
  
  def self.keyword_search(keywords)
    keywords = "%" + keywords + "%"
    Product.where("name LIKE ? OR description LIKE ?", keywords, keywords)
  end
  #def self.search(search)
    #if search
      #self.where('name LIKE ?', "#{search}")
    #else
      #self.all
    #end
  #end
end
