class Product < ActiveRecord::Base
  validates :name, :description, :price, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

  
  mount_uploader :image, ProductImageUploader
  
  belongs_to :category, foreign_key: "category_id"
  has_many :line_items
  
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
