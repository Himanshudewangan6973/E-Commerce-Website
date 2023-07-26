class OrdersController < ApplicationController
    def index
        @orders=Order.where(uid:Current.user).where.not(status:"Item Delivered")
    end

    def new
        @order = Order.new
    end

    def payment
      @user=Order.where(uid:Current.user).update(payid:"Payment Completed")
      redirect_to order_path
    end
  
    def pastorders
      @user=Order.where(uid:Current.user).where(status:"Item Delivered")
      # redirect_to pastorders_path
    end

    def delete
      @orders = Order.find(params[:id])
      @pr=Product.find(@orders.pid)
      quan=(@pr.quantity).to_i + @orders.quan.to_i
      @pr=Product.where(id:@orders.pid).update(quantity:quan)
      @orders.destroy
      redirect_to order_path
      # redirect_to @order, status: :see_other
    end

    def create
        @order = Order.new
        @order.cart_id=params[:id]
        @cart=Cart.find(params[:id])
        @order.price=@cart.price
        @order.quan=@cart.quantity
        @order.pid=@cart.pid
        @order.payid="Payment Pending"
        @order.uid=Current.user.id
        @order.status="Order Confirmed"
        if @order.save
          @pr=Product.find(@cart.pid)
          quan=(@pr.quantity).to_i - @cart.quantity.to_i
          @pr=Product.where(id:@cart.pid).update(quantity:quan)
          @cart = Cart.find(params[:id])
            @cart.destroy
            redirect_to order_path
            
          else
            render :new, status: :unprocessable_entity
          end
    end
    private
    def order_params
      params.require(:order).permit(:pid, :uid,:cart_id,:quantity,:price,:status,:payid)
    end
end
