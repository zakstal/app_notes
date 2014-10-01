def self.find_by_credentials(username, password)
  user = User.find_by(username: username)

  return nil if user.nil?

  password_digest = Digest::SHA2.hexdigest(user.salt + password)
  user.password_digest == password_digest ? user : nil

end