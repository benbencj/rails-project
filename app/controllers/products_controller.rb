class ProductsController < InheritedResources::Base
  def index
    @products = Product.all
    @products = Product.order("name").page(params[:page]).per(5)    
  end
   
   
  def search
  end
  
  def search_results
    @products = Product.keyword_search(params[:search])  
  end
   
  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity, :image, :category_id, :status)
    end
end

