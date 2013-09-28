require 'spec_helper'

describe UsersController do
  describe 'GET #index' do
    before do
      get :index
    end

    it { should respond_with :success }
  end
end
