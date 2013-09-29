# -*- coding: utf-8 -*-

step ":twitter_name はTwitterでツイートをふぁぼった" do |twitter_name|
  @favorites_tweets ||= {}
  @favorites_tweets[twitter_name] ||= fixture('favorites.json').read

  stub_request(:get, "https://api.twitter.com/1.1/favorites/list.json").with(query: { screen_name: twitter_name}).to_return {|request|
    {
      body: @favorites_tweets[request.uri.query_values['screen_name']],
      headers: {
        content_type: "application/json; charset=utf-8"
      },
      status: 200
    }
  }
end

step ':twitter_name がふぁぼったツイートが表示されている' do |twitter_name|
  JSON.parse(@favorites_tweets[twitter_name]).each do |tweet|
    page.should have_text tweet['text']
  end
end
