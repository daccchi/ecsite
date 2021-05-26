class ProductsController < ApplicationController
  def index
   @product1 = Product.find(1)
   @product2 = Product.find(2)
   @product3 = Product.find(3)
   @product4 = Product.find(4)
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    
    @product = current_customer.products.build(product_params)
    if @product.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to 'toppages/index'
    else
      @product = current_customer.products.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
   private

  def product_params
    params.require(:product).permit(:price,:product_name)
  end
  
  
end
