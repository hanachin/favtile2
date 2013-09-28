# -*- coding: utf-8 -*-
step ":twitter_name が :tweet をふぁぼった" do |twitter_name, tweet|
  @tweets ||= {}
  @tweets[twitter_name] ||= []
  @tweets[twitter_name] << tweet
end
