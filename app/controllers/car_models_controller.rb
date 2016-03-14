class CarModelsController < ApplicationController
  before_action :set_mark, only: [:index]
  before_action :set_car_model, only: [:show, :update, :destroy]

  # GET /car_models
  def index
    @car_models = @mark.car_models.all.order(:id)

    render json: @car_models
  end

  # GET /car_models/1
  def show
    render json: @car_model
  end

  # POST /car_models
  def create
    @car_model = CarModel.new(car_model_params)

    if @car_model.save
      render json: @car_model, status: :created, location: @car_model
    else
      render json: @car_model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /car_models/1
  def update
    if @car_model.update(car_model_params)
      render json: @car_model
    else
      render json: @car_model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /car_models/1
  def destroy
    @car_model.destroy
  end

  private
    def set_mark
      @mark = Mark.find(params[:mark_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_car_model
      @car_model = CarModel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def car_model_params
      params.require(:car_model).permit(:mark, :model)
    end
end
