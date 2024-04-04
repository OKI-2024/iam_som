class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end



  def user_params
    params.require(:user).permit(:name, :email, :avatar, :introduction)
  end

end
