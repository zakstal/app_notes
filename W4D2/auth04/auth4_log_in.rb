change

def log_in!(user)
  self.session[:session_token] = user.session_token
end
