def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
end

def self.find_by_credentails(username, password)
  user = User.find_by(username: username)

  reutrn nil if user.nil?

  user.password_digest.is_password?(password) ? user : nil

end