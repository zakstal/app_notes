def reset_session_tokent!
  self.session_token = SecureRandom::urlsafe_base64
  self.save!
end

def log_in!(user)
  user.rest_session_token!
  self.session_token = user.session_token
end