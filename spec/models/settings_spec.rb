require 'spec_helper'

describe 'Settings' do
  subject { Settings }

  # default values
  its('twitter.consumer_key')    { should eq 'YOUR_TWITTER_CONSUMER_KEY' }
  its('twitter.consumer_secret') { should eq 'YOUR_TWITTER_CONSUMER_SECRET' }

  # reset Settings if ENV is stubbed
  before do
    Settings.reload!
  end

  context 'environment variables is exists' do
    let(:twitter_consumer_key)    { 'i wanna eat ra-men so much' }
    let(:twitter_consumer_secret) { 'i wanna eat abura-soba so much' }
    let(:env) {
      {
        'TWITTER_CONSUMER_KEY'    => twitter_consumer_key,
        'TWITTER_CONSUMER_SECRET' => twitter_consumer_secret
      }
    }

    before do
      stub_const('::ENV', env)
      Settings.reload!
    end

    its('twitter.consumer_key')    { should eq twitter_consumer_key }
    its('twitter.consumer_secret') { should eq twitter_consumer_secret }
  end
end
