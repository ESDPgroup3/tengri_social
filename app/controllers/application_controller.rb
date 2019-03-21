# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_activity

  protected

  def configure_permitted_parameters
    added_attrs = %i[phone password password_confirmation remember_me avatar nickname]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def user_log_in?
    redirect_to root_path unless user_signed_in?
  end

  def after_sign_in_path_for(_resources)
    if current_user.nickname
      posts_path
    else
      nickname_path
    end
  end
  
  def after_sign_up_path_for(resource)
    nickname_path
  end

  def after_inactive_sign_up_path_for(resource)
    nickname_path
  end



  private

  def user_activity
    current_user.try :touch
  end
end
