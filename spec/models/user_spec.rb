require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should allow_value(nil).for(:provider) }

  describe '.find_or_create_by_omniauth! with twitter auth' do
    let(:auth) {
      {
        uid:         'uid',
        provider:    'twitter',
        credentials: { token: 'token', secret: 'secret' },
        raw_info:    { name: ';)' },
        info:        { nickname: 'john_doe' }
      }
    }

    context 'if twitter authentication exists in database' do
      let!(:provider) { create(:provider, uid: auth[:uid], provider: auth[:provider]) }

      subject { -> { User.find_or_create_by_omniauth!(auth) } }

      it { should_not change(User, :count) }
      it { should_not change(Provider, :count) }

      specify do
        expect(subject.call).to eq provider.user
      end

      context 'when user name is changed' do
        let(:auth) {
          super().merge(raw_info: { name: ';) xoxo' }, info: { nickname: 'john_doe ;)' })
        }

        it { should_not change(User, :count) }
        it { should_not change(Provider, :count) }
      end
    end

    context 'if twitter authentication not exists in database' do
      subject { -> { User.find_or_create_by_omniauth!(auth) } }

      it { should change(User, :count).by(1) }
      it { should change(Provider, :count).by(1) }

      describe 'create correct user' do
        subject { User.find_or_create_by_omniauth!(auth) }

        it { should be_kind_of User }
        its(:name)                  { should eq auth[:info][:nickname] }
        its('provider.uid')         { should eq auth[:uid] }
        its('provider.provider')    { should eq auth[:provider] }
        its('provider.credentials') { should eq auth[:credentials] }
        its('provider.raw_info')    { should eq auth[:raw_info] }
      end

      shared_examples 'not create user and provider if error raised' do
        subject { -> { User.find_or_create_by_omniauth!(auth) rescue nil } }

        it { should_not change(User, :count) }
        it { should_not change(Provider, :count) }
      end

      context 'create provider failed' do
        before do
          User.any_instance.stub(:valid?) { false }
        end

        it_behaves_like 'not create user and provider if error raised'
      end

      context 'create user failed' do
        before do
          User.any_instance.stub(:valid?) { false }
        end

        it_behaves_like 'not create user and provider if error raised'
      end
    end
  end

  describe '#access_token' do
    let(:user) { create(:user) }
    subject { user }
    its(:access_token) { should eq user.provider.credentials['token'] }
  end

  describe '#access_token_secret' do
    let(:user) { create(:user) }
    subject { user }

    before { user.reload }

    its(:access_token_secret) { should eq user.provider.credentials['secret'] }
  end
end
