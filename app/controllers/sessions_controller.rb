# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  layout 'application'

  def new
    @user = User.find_by_phone(cookies[:phone])
    @nickname = @user.nickname
    super
  end
end
