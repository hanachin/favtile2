require 'spec_helper'

describe AuthsController do
  describe '#twitter' do
    before do
      get :twitter
    end

    it { should respond_with :success }
  end

  describe '#failure' do
    before do
      get :failure
    end

    it { should respond_with :success }
  end
end
