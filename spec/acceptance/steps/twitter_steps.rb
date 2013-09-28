# -*- coding: utf-8 -*-
step ":twitter_name が :tweet をふぁぼった" do |twitter_name, tweet|
  @favorites_tweets ||= {}
  @favorites_tweets[twitter_name] ||= []
  @favorites_tweets[twitter_name] << tweet
end
