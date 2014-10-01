calss Applicationcocontroller

def  log_in!(user)
sesssion[:user_id] = user.id
end

def current_user
#find user from session
return nil if session[:user_id].nil?
  User.find(session[:user_id])
end

def  log_in!(user)
  sesssion[:user_id] = user.id
end


def log_out!
  session[:user_id]= nil
end

end