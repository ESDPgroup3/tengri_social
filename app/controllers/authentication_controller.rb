class AuthenticationController < ApplicationController
  layout 'application'
  def login_or_signup
  end

  def show_form
  end

  def look_for
    @phone = params[:phone]
    @user = User.where(phone: params[:phone])
    if @user.exists?
      redirect_to new_user_session_path(phone: @phone)
    else
      redirect_to new_user_registration_path(phone: @phone)
    end
  end
end
