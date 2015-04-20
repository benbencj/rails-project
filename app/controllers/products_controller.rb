class ProductsController < InheritedResources::Base
  def index
    @products = Product.all
    #@category = Category.find(params[:id])
  end
  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity, :image, :category_id)
    end
end

