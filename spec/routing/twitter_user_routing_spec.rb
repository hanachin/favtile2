require 'spec_helper'

describe 'routes for Users' do
  it 'routes /:id to the twitter users controller' do
    { get: '/hanachin' }.should route_to(controller: 'twitter_users', action: 'show', id: 'hanachin')
  end
end
