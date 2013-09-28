FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "name#{n}"}
    after(:create) do |user, evaluator|
      FactoryGirl.create(:provider, user: user) unless user.provider
      user.reload
    end
  end
end
