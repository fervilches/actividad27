class ProductsController < ApplicationController
  def create
    @product.create(product_params)
    @product.category_id = params[:category:id]
    if @product.save
    redirect_to category_path(@product.category_id)
  else
    redirect_to category_path(params[:category_id])
  end

private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
