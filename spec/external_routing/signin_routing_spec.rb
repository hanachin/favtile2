# Move this spec to under the spec/routing if issue #801 of rspec-rails resolved
# https://github.com/rspec/rspec-rails/issues/801

require 'spec_helper'

describe 'routes for signin', type: :request do
  it 'routes /signin redirect to /auth/twitter' do
    get '/signin'
    response.should redirect_to '/auth/twitter'
  end
end
