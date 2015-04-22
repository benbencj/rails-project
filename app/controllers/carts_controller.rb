class CartsController < InheritedResources::Base
   
  
  def destroy  
    @cart = current_cart  
    @cart.destroy  
    session[:cart_id] = nil  
  
    respond_to do |format|  
      format.html { redirect_to(root_path,  
        :notice => 'Your cart is currently empty') }  
      format.xml  { head :ok }  
    end  
  end 
  
  private

    def cart_params
      params.require(:cart).permit()
    end
end

