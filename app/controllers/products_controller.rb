class ProductsController < ApplicationController
  before_action :reassign_cover_param, only: [:create, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    build_cover
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:notice] = "Created"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    if @product.update_attributes product_params
      flash[:notice] = "Updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit Product::PRODUCT_PARAMS, cover_attributes: Product::PRODUCT_COVER_PARAMS
  end

  def build_cover
    @product.build_cover
  end

  def reassign_cover_param
    params[:product][:cover_attributes][:content] ||= params[:product][:cover_attributes][:content_cache]
  end
end
