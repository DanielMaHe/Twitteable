class UsersController < ApplicationController
  # before_action :set_user, only: %i[show edit update destroy]
  before_action :set_user, only: [:show]

  skip_before_action :authenticate_user!, only: %i[index show]

  # # GET /users
  def index; end

  # GET /users/1
  def show
    @user = User.find_by(username: params[:username])
  end

  # def edit
  #   binding.pry
  #   @user = User.find_by(username: params[:username])
  #   authorize @user
  # end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
    # @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :username, :name, :avatar, :password, :role)
  end
end
