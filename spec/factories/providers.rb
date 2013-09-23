FactoryGirl.define do
  factory :provider do
    user
    sequence(:uid)
    provider 'twitter'
  end
end
