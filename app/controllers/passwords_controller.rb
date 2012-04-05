class PasswordsController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_with_password(params[:user])
      sign_in(@user, :bypass => true)
      redirect_to edit_user_password_path, :notice => "Password updated!"
    else
      @user.update_attributes(params[:user])
      redirect_to edit_user_password_path, :notice => "Notification Settings Updated"
    end
  end
end
