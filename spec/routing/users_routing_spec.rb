require 'spec_helper'

describe 'routes for Users' do
  it 'routes / to the users controller' do
    { get: '/' }.should route_to(controller: 'users', action: 'index')
  end
end
