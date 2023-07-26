class WelcomeController < ApplicationController
  def index
    @products = Product.all.order("id DESC")
  end
  def show
    @products = Product.find(params[:id])
  end
  def category
    @products = Product.all
  end
  def search
    if params[:key].blank?
      @products = Product.all.order("id DESC")
    else
      # @products = Product.where("name = ?", params[:key])
      @products = Product.where('name LIKE ? ', "%" + params[:key] + "%")
      #@products = Product.where("name = ?", name.match(params[:key]))
    end
    render :index
  end
end
