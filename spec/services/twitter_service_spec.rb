require 'spec_helper'

describe TwitterService do
  describe 'initialize' do
    let(:user) { create(:user) }
    let(:user_credentials) {
      {
        consumer_key:        Settings.twitter.consumer_key,
        consumer_secret:     Settings.twitter.consumer_secret,
        access_token:        user.access_token,
        access_token_secret: user.access_token_secret
      }
    }

    it 'create twitter rest client with user credentials' do
      Twitter::REST::Client.should_receive(:new).with(user_credentials)
      TwitterService.new(user)
    end
  end

  describe '#favorites' do
    let(:user) { double('user', access_token: 'token', access_token_secret: 'secret') }
    let(:client) { double }
    subject { TwitterService.new(user) }
    before do
      subject.stub(:client) { client }
    end
    it 'get favorites tweets via twitter client' do
      client.should_receive(:favorites).with('hanachin_', include_entities: true)
      subject.favorites('hanachin_', include_entities: true)
    end
  end
end
