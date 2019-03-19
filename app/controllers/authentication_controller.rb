# frozen_string_literal: true

class AuthenticationController < ApplicationController
  before_action :user_signed?, except: [:add_nickname]
  layout 'application'

  def show_form; end

  def add_nickname; end

  def nickname_exists
    @nick_exists = User.exists?(nickname: params[:nickname])
    p params[:nickname]
    respond_to do |format|
      format.js { render json: @nick_exists }
    end
  end

  def look_for
    cookies[:phone] = params[:phone]
    @phone = cookies[:phone]
    @user = User.find_by_phone(@phone)
    if @user
      redirect_to new_user_session_path
    else
      redirect_to new_user_registration_path(phone: @phone)
    end
  end
end
