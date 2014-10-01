controller dies after each request

within our controller, ActionController::Base#session we can set and retrieve state of a session (e.g. session[:user_id] = @user.id)

# generate a 16-digit random token
   u.session_token = SecureRandom::urlsafe_base64(16)
   u.save!

   # put the generated token in the client's cookies
   session[:session_token] = u.session_token
   redirect_to feed_url

    session_token = session[:session_token]

the above is not real good code

<% flash[:notices].try(:each) do |msg| %>
  <%= msg %>
<% end %


---auth-00 user model---

develpment gems
pry-rails
better_errors
binding_of_caller


?: look back at how json nests with []

---auth02: Password Digest---

Digest::SHA2.hexdigest("password") creats a has password

---auth03: Password Pseudeo-attribute--

a model can take an attribute
then make an attr_wrtier by hand to use the hexdigest
def password=(password)
  @password = password
  self.password_digest = Digest::SHA2.hexdigest(password)
end


in a case where there is updateing of info you dont need to validate password
  validates :password, length: { minimum: 6, allow_nil: true}

---auth-04:Session Token---

log out same person on another machine
store session token
add a session token column to users
session token is a random number
add session token must be present validation
add a before_validation call back

self.session_token = SecureRandom::urlsafe_base64

session token takes place of id for searching and validating and logging in

log out user by reseting session token

---auth-05:BCrypt---
