class OrderStatesController < ApplicationController
  before_action :set_order_state, only: [:show, :update, :destroy]

  # GET /order_states
  def index
    @order_states = OrderState.all

    render json: @order_states
  end

  # GET /order_states/1
  def show
    render json: @order_state
  end

  # POST /order_states
  def create
    @order_state = OrderState.new(order_state_params)

    if @order_state.save
      render json: @order_state, status: :created, location: @order_state
    else
      render json: @order_state.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_states/1
  def update
    if @order_state.update(order_state_params)
      render json: @order_state
    else
      render json: @order_state.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_states/1
  def destroy
    @order_state.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_state
      @order_state = OrderState.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_state_params
      params.require(:order_state).permit(:name)
    end
end
