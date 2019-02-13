class AuthenticationController < ApplicationController
 before_action :user_signed?
  layout 'authentication'

  def add_nickname; end

  def show_form; end

  def look_for
    @phone = params[:phone]
    @user = User.find_by_phone(@phone)
    if @user
      redirect_to new_user_session_path(phone: @phone)
    else
      redirect_to new_user_registration_path(phone: @phone)
    end
  end
end
