class OrdersController < InheritedResources::Base
  def new  
    @cart = current_cart  
    if @cart.line_items.empty?  
      redirect_to root_path, :notice => "Your cart is empty"  
      return  
    end  
    
    @order = Order.new  
    respond_to do |format|  
      format.html # new.html.erb   
    end  
  end
  
  def create  
    @order = Order.new  
    @order.add_line_items_from_cart(current_cart)  
    
    respond_to do |format|  
      if @order.save  
        Cart.destroy(session[:cart_id])  
        session[:cart_id] = nil  
        format.html { redirect_to(orders_path, :notice =>   
          'Thank you for your order.') }   
      else  
        format.html { render :action => "new" }   
      end  
    end  
  end  

  private

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type, :status)
    end
end

