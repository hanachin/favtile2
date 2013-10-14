if defined?(WebMock) && Rails.env.development?
  WebMock.allow_net_connect!
  WebMock::API.stub_request(:get, "https://api.twitter.com/1.1/favorites/list.json").with(query: { screen_name: 'hanachin_'}).to_return do |request|
    {
      body: File.new("#{Rails.root}/spec/fixtures/hanachin.json"),
      headers: {
        content_type: "application/json; charset=utf-8"
      },
      status: 200
    }
  end
end
