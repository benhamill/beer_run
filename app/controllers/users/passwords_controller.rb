class Users::PasswordsController < Devise::PasswordsController
  # before_filter :authenticate_user!

  def edit
    Rails.logger.info("\n\n\nWOAH!\n\n\n\n")
    render text: 'WOAH' and return
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_with_password(params[:user])
      sign_in(@user, :bypass => true)
      redirect_to root_url, :notice => "Password updated!"
    else
      render :edit
    end
  end
end