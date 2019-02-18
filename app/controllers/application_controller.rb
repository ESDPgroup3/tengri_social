class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_activity


  protected

  def configure_permitted_parameters
    added_attrs = [:phone, :password, :password_confirmation, :remember_me, :avatar, :nickname]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def user_log_in?
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resources)
    posts_path
  end

  def user_signed?
    if user_signed_in?
      nickname_path(current_user)
    end
  end 


  private

  def user_activity
    current_user.try :touch
  end
end
