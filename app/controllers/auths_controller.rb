class AuthsController < ApplicationController
  def twitter
    @user = User.find_or_create_by_omniauth!(omniauth_hash)
    redirect_to user_path id: omniauth_hash[:info][:nickname]
  end

  def failure
    render nothing: true
  end

  private

  def omniauth_hash
    request.env['omniauth.auth']
  end
end
