class SessionsController < ApplicationController
  before_action :require_signed_out!, only: [:new, :create]
  before_action :require_signed_in!, only: [:destroy]

  def create
    @user = User.find_by_credentails(
    user_params[:username],
    user_params[:password]
    )

    if @user
      sign_in(@user)
      redirect_to user_url(@user)
    else
      render :new
    end

    def destroy
      sign_out!
      redirect_to new_session_url

    end
  end
end