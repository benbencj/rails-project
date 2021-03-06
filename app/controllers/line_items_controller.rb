class LineItemsController < InheritedResources::Base
  def create  
   @cart = current_cart  
   product = Product.find(params[:product_id])  
   @line_item = @cart.line_items.build(:product => product)   
  
   respond_to do |format|  
     if @line_item.save  
       format.html { redirect_to(@line_item.cart,  
         :notice => 'Line item was successfully created.') }    
     else  
       format.html { render :action => "new" }  
     end  
   end
  end
  
  

  private

    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id, order_id)
    end
end

