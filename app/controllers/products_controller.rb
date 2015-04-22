class ProductsController < InheritedResources::Base
  def index
    @products = Product.all
    @products = Product.order("name").page(params[:page]).per(4)    
  end
   
   
  def search
  end
  
  def search_results
    @products = Product.keyword_search(params[:search])  
  end
  
  def add_product_to_cart
    session[:product_to_cart] << params[:id].to_i
    session[:product_to_cart].uniq!
    redirect_to :back
  end
  
  def remove_product_from_cart
    session[:product_to_cart].delete(params[:id].to_i)
    redirect_to :back
  end
  
  def clear_cart
    session[:product_to_cart] = nil
    redirect_to :back
  end
  
  
   
  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity, :image, :category_id, :status)
    end
end

