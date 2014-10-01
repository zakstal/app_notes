class UsersController <ApplicationController

def create
  @user = User.new(user_params)
  if @user.save
    log_in!(@user)
    redirect_to user_url
  else
    render :new
  end

end
def new


end

def show

end

protected

def user_params
  params.require(:user).permit(:username, :password)
end

end