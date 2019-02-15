class RegistrationsController < Devise::RegistrationsController
  layout 'application'
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_sign_up_path_for(resources)
    nickname_path
  end

  def after_update_path_for(resource)
    user_path(resource)
  end
end
