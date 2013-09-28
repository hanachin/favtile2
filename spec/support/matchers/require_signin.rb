RSpec::Matchers.define :require_signin do |attribute|
  match do |actual|
    expect(attribute).to redirect_to Rails.application.routes.url_helpers.signin_path
  end

  failure_message_for_should do |actual|
    "expected to require sign in to access the method"
  end

  failure_message_for_should_not do |actual|
    "expected not to require sign in to access the method"
  end

  description do
    "redirect to the sign in form"
  end
end
