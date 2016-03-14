class CarMakesController < ApplicationController
  before_action :set_car_make, only: [:show, :update, :destroy]

  # GET /car_makes
  def index
    @car_makes = CarMake.all

    render json: @car_makes
  end

  # GET /car_makes/1
  def show
    render json: @car_make
  end

  # POST /car_makes
  def create
    @car_make = CarMake.new(car_make_params)

    if @car_make.save
      render json: @car_make, status: :created, location: @car_make
    else
      render json: @car_make.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /car_makes/1
  def update
    if @car_make.update(car_make_params)
      render json: @car_make
    else
      render json: @car_make.errors, status: :unprocessable_entity
    end
  end

  # DELETE /car_makes/1
  def destroy
    @car_make.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_make
      @car_make = CarMake.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def car_make_params
      params.require(:car_make).permit(:mark)
    end
end
