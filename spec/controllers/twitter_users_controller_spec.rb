require 'spec_helper'

describe TwitterUsersController do
  describe 'GET #show' do
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
    end
  end
end
