class AuthsController < ApplicationController
  def twitter
    render nothing: true
  end

  def failure
    render nothing: true
  end
end
