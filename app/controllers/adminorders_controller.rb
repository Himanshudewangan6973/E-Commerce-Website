class AdminordersController < ApplicationController
    def index
        @orders=Order.where(payid:"Payment Completed")
    end

    def paid
        @orders=Order.where(id:params[:id]).update(status:"Item Delivered")
        redirect_to adminorder_path
    end
end