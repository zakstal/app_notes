class sessionsController <ApplcationController

  def create
    @user = User.find_by(
    username: params[:user][:username],
    password: params[:user][:password]
    )
    if @user.nil?
      render :new
    else
      session[:user_id] = @user.id
        redirect_t user_url
    end
  end

  def destroy
    log_out!
    redirect ot user_url
  end

  def new
    render new
  end

  def show

    if current_user.nil?
      redirect_to new_session_url
      return
    end


  end

  def  user_params
  password_digest =  Digest::SHA2.hexdigest(params[:user][:password])
    { username: params[:user][:usernae],
      passwrod_digest: password_digest}

end