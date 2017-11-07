class ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]
    if @product.save
    redirect_to category_path(@product.category_id)
  else
    redirect_to category_path(params[:category_id])
  end
end

  def destroy
    @product = Product.find(params[:id]).destroy
    redirect_to category_path(@product.category_id)
  end

private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
