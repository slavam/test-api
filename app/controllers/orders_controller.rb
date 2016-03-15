class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  before_action :require_user, only: [:create, :show, :index]
  # before_action :check_user, only: [:create, :show, :index]

  # GET /orders
  def index
    @orders = @user.orders.all.order(:id)

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    unless @user.confirmated?
      render json: @user.errors, status: :unprocessable_entity 
    end
    @order = @user.orders.build(order_params)
    @order.order_state_id = 1 # new order
    
    loc_from = Location.create(lat: params[:from_lat], lng: params[:from_lng])
    loc_to = Location.create(lat: params[:to_lat], lng: params[:to_lng])

    @order.from_location_id = loc_from.id
    @order.to_location_id = loc_to.id
    
    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def require_user
      # @user = User.find_by(code_token: params[:api_token])
      if @order
        user_id = @order.user_id
      else
        user_id = params[:user_id]? params[:user_id] : params[:order][:user_id]
      end
      @user = User.find(user_id)
      token = request.env['HTTP_API_TOKEN']? request.env['HTTP_API_TOKEN'] : params[:api_token]
      @user.authenticate(token)
    end
    
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      # params.require(:order).permit(:user_id, :from_location_id, :to_location_id, :order_state_id, :cost, :comment, :author, :score)
      params.require(:order).permit(:cost, :comment, :author, :score)
    end
    
    # def check_user
    #   token = request.env['HTTP_API_TOKEN']? request.env['HTTP_API_TOKEN'] : params[:api_token]
    #   @user.authenticate(token)
    # end
end
