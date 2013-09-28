FactoryGirl.define do
  factory :provider do
    user
    sequence(:uid)
    provider 'twitter'
    credentials { {'token' => 'access token ;)', 'secret' => 'access token secret ;)' } }
  end
end
