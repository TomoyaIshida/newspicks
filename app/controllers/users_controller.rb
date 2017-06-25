class UsersController < ApplicationController

  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if User.find(params[:id]).update(user_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :company, :position, :profile)
  end
end
