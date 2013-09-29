
class TwitterUsersController < ApplicationController
  before_filter :require_signin

  def show
    require 'webmock'
    WebMock::API.stub_request(:get, "https://api.twitter.com/1.1/favorites/list.json").with(query: { screen_name: 'hanachin_'}).to_return {|request|
      {
        body: File.new("#{Rails.root}/spec/fixtures/favorites.json"),
        headers: {
          content_type: "application/json; charset=utf-8"
        },
        status: 200
      }
    }
    @favorites = twitter_client.favorites(params[:id])
  end

  def twitter_client
    TwitterService.new(current_user)
  end
end
