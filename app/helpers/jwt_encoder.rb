module JwtEncoder
  extend self

  HMAC_SECRET = Settings.secrets.jwt_secret

  def encode(payload)
    JWT.encode(payload, HMAC_SECRET)
  end

  def decode(token)
    JWT.decode(token, HMAC_SECRET).first
  end
end
