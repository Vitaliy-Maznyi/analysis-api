module TokenHelper
  def self.generate_token
    tokens = {}
    client_id = SecureRandom.urlsafe_base64(nil, false)
    token     = SecureRandom.urlsafe_base64(nil, false)

    tokens[client_id] = {
        'token' => BCrypt::Password.create(token),
        'expiry' => 1473894998
    }
    return tokens
  end
end
