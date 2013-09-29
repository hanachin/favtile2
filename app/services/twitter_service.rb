class TwitterService
  def initialize(user)
    @client = Twitter::REST::Client.new({
      consumer_key: Settings.twitter.consumer_key,
      consumer_secret:     Settings.twitter.consumer_secret,
      access_token:        user.access_token,
      access_token_secret: user.access_token_secret
    })
  end

  def client; @client; end

  def favorites(twitter_name, options = {})
    client.favorites(twitter_name, options)
  end
end
