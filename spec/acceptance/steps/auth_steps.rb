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

step ':twitter_name としてサインインした' do |twitter_name|
  __send__ ':twitter_name としてTwitter認証に成功する', twitter_name
  __send__ 'トップページを表示する'
  __send__ ':text をクリックする', 'Signin with Twitter'
  __send__ ':twitter_name のお気に入りページが表示される', 'hanachin_'
end
