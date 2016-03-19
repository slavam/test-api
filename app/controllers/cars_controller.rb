class CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :destroy]
  before_action :require_user, only: [:create, :update, :show, :destroy]


  # GET /cars
  def index
    @cars = Car.all

    render json: @cars
  end

  # GET /cars/1
  def show
    render json: @car
  end

  # POST /cars
  def create
    # @car = Car.new(car_params)
    @car = @user.build_car(car_params)
    @user.have_car = true
    if params[:car][:make_model_id]
      model = MakeModel.find(params[:car][:make_model_id])
      # puts "model="+model.to_s
      if model
        @car.model = model.model
        @car.make = model.car_make.mark
      end
    end
    if @car.save
      render json: @car, status: :created, location: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    if @car.destroy 
      render json: {message: "Car deleted"}
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def require_user
      # @user = User.find_by(code_token: params[:api_token])
      if @car
        user_id = @car.user_id
      else
        user_id = params[:user_id]? params[:user_id] : params[:car][:user_id]
      end
      @user = User.find(user_id)
      token = request.env['HTTP_API_TOKEN']? request.env['HTTP_API_TOKEN'] : params[:api_token]
      unless @user.authenticate(token)
        render json: {message: "Authentication problem"}, status: :unprocessable_entity
      end
    end
    
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def car_params
      params.require(:car).permit(:user_id, :make, :model, :manufacture_year, :color, :plate, :make_model_id, :lat, :lng)
    end
end
