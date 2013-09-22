class AuthsController < ApplicationController
  def twitter
    render json: { env: request.env['omniauth.auth'], params: params }
  end

  def failure
    render nothing: true
  end
end
