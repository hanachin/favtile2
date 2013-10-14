class TwitterUsersController < ApplicationController
  before_filter :require_signin

  def show
    @twitter_name = params[:id]
    @favorites    = twitter_client.favorites(@twitter_name)
  end

  def twitter_client
    TwitterService.new(current_user)
  end
end
