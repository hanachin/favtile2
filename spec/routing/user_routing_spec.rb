require 'spec_helper'

describe 'routes for Users' do
  it 'routes /users/:id to the auths controller' do
    { get: '/users/hanachin' }.should route_to(controller: 'users', action: 'show', id: 'hanachin')
  end
end
