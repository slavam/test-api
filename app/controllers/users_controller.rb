class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :user_by_phone, only: :login
  before_action :check_user, only: [:show, :update]

  # PUT
  def login
    if !@user.confirmated?
      if @user.code_token != params[:sms_code]
        render json: @user.errors, status: :unprocessable_entity
      else
        @user.remember_token
        @user.user_state_id = 2
        @user.save
        render json: @user
      end
    else
      # render json: @user
    end
  end
  
  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    if !@user.confirmated?
      render json: @user.errors, status: :unprocessable_entity
    else
      render json: @user, status: 200 
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.user_state_id = 1
    @user.code_token = '6969' #(0..9).to_a.shuffle[0..3].join

    if @user.save
      # send sms with @user.code_token
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if !@user.confirmated?
      render json: @user.errors, status: :unprocessable_entity
    else
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def user_by_phone
      @user = User.find_by(phone: params[:phone])
    end
    
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      # params.require(:user).permit(:phone, :user_state_id, :first_name, :last_name, :date_of_birth, :picture, :city, :have_car, :code_token)
      params.require(:user).permit(:phone, :first_name, :last_name, :date_of_birth, :picture, :city, :have_car, :code_token)
    end
    
    def check_user
      token = request.env['HTTP_API_TOKEN']? request.env['HTTP_API_TOKEN'] : params[:api_token]
      @user.authenticate(token)
    end
end
