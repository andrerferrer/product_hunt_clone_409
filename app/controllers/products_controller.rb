class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new strong_params
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:product).permit(:name, :tagline)
  end
end
