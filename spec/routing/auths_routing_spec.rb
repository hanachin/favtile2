require 'spec_helper'

describe 'routes for Sessions' do
  it 'routes /auth/twitter/callback to the auths controller' do
    { get: '/auth/twitter/callback' }.should route_to(controller: 'auths', action: 'twitter')
  end

  it 'routes /auth/failure to the auths controller' do
    { get: '/auth/failure' }.should route_to(controller: 'auths', action: 'failure')
  end
end
