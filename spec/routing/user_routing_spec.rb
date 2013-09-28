require 'spec_helper'

describe 'routes for Users' do
  it 'routes /:id to the users controller' do
    { get: '/hanachin' }.should route_to(controller: 'users', action: 'show', id: 'hanachin')
  end
end
