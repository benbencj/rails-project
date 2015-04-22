class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type, :status)
    end
end

