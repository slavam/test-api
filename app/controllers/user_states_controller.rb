class UserStatesController < ApplicationController
  before_action :set_user_state, only: [:show, :update, :destroy]

  # GET /user_states
  def index
    @user_states = UserState.all

    render json: @user_states
  end

  # GET /user_states/1
  def show
    render json: @user_state
  end

  # POST /user_states
  def create
    @user_state = UserState.new(user_state_params)

    if @user_state.save
      render json: @user_state, status: :created, location: @user_state
    else
      render json: @user_state.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_states/1
  def update
    if @user_state.update(user_state_params)
      render json: @user_state
    else
      render json: @user_state.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_states/1
  def destroy
    @user_state.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_state
      @user_state = UserState.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_state_params
      params.require(:user_state).permit(:name)
    end
end
