class MakeModelsController < ApplicationController
  before_action :set_make, only: [:index]
  before_action :set_make_model, only: [:show, :update, :destroy]

  # GET /make_models
  def index
    # @make_models = MakeModel.all
    @make_models = @make.make_models.all.order(:id)

    render json: @make_models
  end

  # GET /make_models/1
  def show
    render json: @make_model
  end

  # POST /make_models
  def create
    @make_model = MakeModel.new(make_model_params)

    if @make_model.save
      render json: @make_model, status: :created, location: @make_model
    else
      render json: @make_model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /make_models/1
  def update
    if @make_model.update(make_model_params)
      render json: @make_model
    else
      render json: @make_model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /make_models/1
  def destroy
    @make_model.destroy
  end

  private
    def set_make
      @make = CarMake.find(params[:car_make_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_make_model
      @make_model = MakeModel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def make_model_params
      params.require(:make_model).permit(:car_make_id, :model)
    end
end
