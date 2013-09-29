require 'spec_helper'

describe TwitterUsersController do
  let(:favorites) { 'favorites' }
  let(:twitter_client) { double('twitter client', favorites: favorites) }

  describe 'GET #show' do
    before do
      controller.stub(:twitter_client) { twitter_client }
    end

    it 'require signin' do
      get :show, id: '/hanachin_'
      expect(response).to require_signin
    end

    context 'user already signed in' do
      let(:user) { create(:user) }

      before do
        set_user_session user
      end

      specify 'not requrie signin' do
        get :show, id: '/hanachin_'
        expect(response).to_not require_signin
      end

      specify 'assigns twitter_client.favorites as @favorites' do
        twitter_client.should_receive(:favorites).with('hanachin_')
        get :show, id: 'hanachin_'
        expect(assigns(:favorites)).to eq favorites
      end
    end
  end

  describe 'twitter_client' do
    let(:user) { double(:user) }

    before do
      controller.stub(:current_user) { user }
    end

    it "create new TwitterService with current_user" do
      TwitterService.should_receive(:new).with(user) { twitter_client }
      get :show, id: '/hanachin_'
    end
  end
end
