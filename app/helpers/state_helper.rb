module StateHelper
  def is_signed_in
    signed_in? ? 'is-signed-in' : ''
  end
end
