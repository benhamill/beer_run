class Users::RegistrationsController < Devise::RegistrationsController
  private

  def devise_mapping
    Devise::Mapping.find_by_path!(request.path)
  end
end
