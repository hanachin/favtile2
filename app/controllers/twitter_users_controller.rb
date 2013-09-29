class TwitterUsersController < ApplicationController
  before_filter :require_signin

  def show
    @favorites = twitter_client.favorites(params[:id])
  end

  def twitter_client
    TwitterService.new(current_user)
  end
end
