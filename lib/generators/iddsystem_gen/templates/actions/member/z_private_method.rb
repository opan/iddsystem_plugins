  private

  def encode_sensitive_key(hashes = {})
    hashes.update(hashes){|key, value| Base64.encode64(value)}
  end
  