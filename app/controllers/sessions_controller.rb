class SessionsController < Devise::SessionsController
    layout 'application'

  def new
    @user = User.find_by_phone(cookies[:phone])
    super
  end
end