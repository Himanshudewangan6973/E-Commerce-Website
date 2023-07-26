class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
end

def edit
  @product = Product.find(params[:id])
end

def update
  @product = Product.find(params[:id])

  if @product.update(product_params)
    redirect_to @product
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @product = Product.find(params[:id])
  @order = Order.where(pid:params[:id])
  if (@order.empty?)
  @product.destroy
  redirect_to @product, status: :see_other
  else
    redirect_to @product, notice:  'Cannot delete product as it is already ordered'
  end
  
end

private
    def product_params
      params.require(:product).permit(:name, :desc,:price,:quantity,:category,:prodimage)
    end
end



