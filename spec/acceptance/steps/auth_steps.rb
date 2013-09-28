# -*- coding: utf-8 -*-
step ':name としてTwitter認証に成功する' do |name|
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    uid:         'uid',
    provider:    'twitter',
    credentials: { token: 'token', secret: 'secret' },
    raw_info:    { name: name },
    info:        { nickname: name }
  })
end
