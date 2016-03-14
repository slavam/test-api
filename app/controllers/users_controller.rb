class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  before_action :user_by_phone, only: :login

  # PUT
  def login
    if @user.user_state_id == 1
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
    if @user.code_token != request.env['HTTP_API_TOKEN']  #request.headers[:api_token]
      render json: @user.errors, status: :unprocessable_entity
      # p request.headers
      # render json: params
    else
      render json: @user
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
    # if @user.user_state_id == 1
    #   if @user.code_token != params[:sms_code]
    #     status = "Wrong sms code"
    #   end
    #   @user.remember_token
    #   @user.user_state_id = 2

    #   @user.save #update(user_params)
      
    # end
    # render json: @user
    
    
    # if @user.update(user_params)
    #   render json: @user
    # else
    #   render json: @user.errors, status: :unprocessable_entity
    # end
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
end
