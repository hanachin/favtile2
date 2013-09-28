# -*- coding: utf-8 -*-
step 'トップページを表示する' do
  visit root_path
end

step ':twitter_name のお気に入りページが表示される' do |twitter_name|
  expect(current_path).to eq twitter_user_path id: twitter_name
end
