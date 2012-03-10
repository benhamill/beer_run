class Users::PasswordsController < Devise::PasswordsController
  skip_before_filter :require_no_authentication, only: [:edit, :update]
  before_filter :authenticate_user!, only: [:edit, :update]
end
