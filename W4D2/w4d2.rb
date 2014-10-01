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

in user params hex digest is put in place

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

adding "salt"(random extra string added to password) to password before digest

find by credentails
gem 'bcrypt-ruby', require: 'bcrypt'

bcrypt is slower

BCrypt::Password.create("password")
will generate a salt for us

will not use in credentails to compaire a newly incripted password
bcrypt makes password objects
call on object: password_object.is_password?("password") and compaires digested
password with one passed in

def self.find_by_credentails(username, password)
  user = User.find_by(username: username)

  reutrn nil if user.nil?

  user.password_digest.is_password?(password) ? user : nil

end

def passwor_digest
  BCrypt::Password.new(super)
end



end


use  password = BCrypte""Password.new(passwordstring)
then use password.is_passsword?(passsword)


end


---auth_06:CSRF Attack---

contrllers are alwasy plurlized

cross site request forgery

---auth-07: Impliement CSRF Protection---

make sight know the reqeust is coming from its sight

application controller
build a protect from forgery

def my_csrf_token
  self.session[:_my_csrf_token] ||= SecureRandom::urlsafe_base64
end

add input tag in form

<input type="hidden" def name="_my_csrf_token" value="<%= my_csrf_token %>">

?: how can info be transefered into view

make controller methods available in the view

helper_method :my_csrf_token

gonig to store token in session to

validate token

befor_filter :validate_csrf_token
def validate_csrf_token
  return if self.request.method == "GET"
  return if self.session[:_my_csrf_token] == self.parmas[:_my_csrf_token]

  rails "CSRF ATTRACK DETECTED"
end

we only want it to work on post put or delete, get is ok.

---auth-08: Rails CSRF Methods---

rails has same methods as above

<input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>"

and use protect_from_forgery with: :exception



end

