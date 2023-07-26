class CartsController < ApplicationController
    def index
        @carts = Cart.where(uid:Current.user.id)
    end
    def new
        @cart = Cart.new
      end
    
      def destroy
        @carts = Cart.find(params[:id])
        @carts.destroy
      
        redirect_to @carts, status: :see_other
      end

      def create
        # Find associated product and current cart
        @chosen_product = Product.find(params[:custId])
        @pr=Product.where(params[:custId])
        current_cart = @current_cart
        # @pr.each do |c|
        #   quan=(c.quantity).to_i - params[:quan].to_i
        # @pr=Product.where(params[:custId]).update(quantity:quan)         
        # end
      
        @carts = Cart.where(uid:Current.user.id).where(pid:params[:custId])
        if @carts.empty?
          # Save and redirect to cart show path
          # @current_cart.save
          @current_cart=Cart.new
          @current_cart.pid=@chosen_product.id
          @current_cart.uid=Current.user.id
          @current_cart.price=@chosen_product.price * params[:quan].to_i
          @current_cart.quantity=params[:quan]
          @current_cart.save
          redirect_to carts_path(current_cart)
        else 
          @carts.each do |c|
            quan=(c.quantity).to_i + params[:quan].to_i
            p=c.price.to_i + (@chosen_product.price * params[:quan].to_i)
            @cart=Cart.where(uid:Current.user.id).where(pid:params[:custId]).update(quantity:quan,price:p)          
          end
            redirect_to carts_path(@cart)
        end
      end
      
      private
        def line_item_params
          params.require(:line_item).permit(:quantity,:product_id, :cart_id)
        end
end