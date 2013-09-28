require 'spec_helper'

describe AuthsController do
  describe '#twitter' do
    let(:auth) {
      {
        uid:         'uid',
        provider:    'twitter',
        credentials: { token: 'token', secret: 'secret' },
        raw_info:    { name: ';)' },
        info:        { nickname: 'john_doe' }
      }
    }
    let(:provider) { create(:provider, user: user, provider: auth[:provider], uid: auth[:uid], credentials: auth[:credentials], raw_info: auth[:raw_info]) }

    let(:user) { create(:user, name: auth[:info][:nickname]) }

    before do
      controller.stub(:omniauth_hash) { auth }
      User.stub(:find_or_create_by_omniauth!).with(auth) { user }
    end

    it 'find or create user by auth' do
      User.should_receive(:find_or_create_by_omniauth!).with(auth) { user }
      get :twitter
    end

    describe 'response' do
      before do
        get :twitter
      end

      it { should redirect_to twitter_user_path id: auth[:info][:nickname] }
    end

    context 'when user name is changed' do
      before do
        user.name = "#{user.name} is old"
        user.save
        get :twitter
      end

      it { should redirect_to twitter_user_path id: auth[:info][:nickname] }
    end
  end

  describe '#failure' do
    before do
      get :failure
    end

    it { should respond_with :success }
  end
end
