class UsersController < ApplicationController
  def show
    sign_out :user
    redirect_to
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  private

  def set_user
    @user = User.new(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
