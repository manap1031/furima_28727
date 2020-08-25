class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
        redirect_to root_path
    else
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confimation, :first_name, :first_name_kana, :last_name, :last_name_kana, :birth_day)
  end
end
