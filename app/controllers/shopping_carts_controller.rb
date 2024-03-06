class ShoppingCartsController < ApplicationController
  before_action :set_shopping_cart, only: %i[ show update destroy ]

  # GET /shopping_carts
  def index
    @shopping_carts = ShoppingCart.all

    render json: @shopping_carts
  end

  # GET /shopping_carts/1
  def show
    render json: @shopping_cart
  end

  # POST /shopping_carts
  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)

    if @shopping_cart.save
      render json: @shopping_cart, status: :created, location: @shopping_cart
    else
      render json: @shopping_cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shopping_carts/1
  def update
    if @shopping_cart.update(shopping_cart_params)
      render json: @shopping_cart
    else
      render json: @shopping_cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shopping_carts/1
  def destroy
    @shopping_cart.destroy!
  end

  def add_to_cart
    cart = ShoppingCart.find_or_create_by(user_id: params[:user_id])
    Product.create(product_id: params[:product_id], shopping_cart: cart)

    render json: cart.products.pluck(:product_id)
  end

  def clean_cart
    cart = ShoppingCart.find_by(user_id: params[:user_id])
    cart.destroy if cart.present?
  end

  def current_user_shopping_cart
    cart = ShoppingCart.find_by(user_id: params[:user_id])

    render json: cart.products.pluck(:product_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_cart
      @shopping_cart = ShoppingCart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_cart_params
      params.require(:shopping_cart).permit(:user_id)
    end
end
