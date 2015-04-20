class FilterController < ApplicationController
  def on_sale
    @products = Product.where(:status => 'on sale')
  end
  
  def new
    @products = Product.where(:status => 'new')
  end
  
  def updated
    @products = Product.where(:status => 'recently updated')
  end
end
