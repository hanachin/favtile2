# -*- coding: utf-8 -*-
step ':twitter_name としてTwitter認証に成功する' do |twitter_name|
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    uid:         'uid',
    provider:    'twitter',
    credentials: { token: 'token', secret: 'secret' },
    raw_info:    { name: twitter_name },
    info:        { nickname: twitter_name }
  })
end
