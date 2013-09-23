class User < ActiveRecord::Base
  has_one :provider, dependent: :destroy
  validates :name,     presence: true
  validates :provider, presence: true, allow_nil: true

  def self.find_or_create_by_omniauth!(auth)
    user = Provider.where(provider: auth[:provider], uid: auth[:uid]).first.try(:user)
    return user if user

    User.new(name: auth[:info][:nickname]).tap do |user|
      User.transaction do
        user.save!
        user.create_provider!(provider: auth[:provider], uid: auth[:uid], credentials: auth[:credentials], raw_info: auth[:raw_info])
      end
    end
  end
end
