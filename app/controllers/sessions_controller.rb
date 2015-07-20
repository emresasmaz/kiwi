class SessionsController < ApplicationController
  skip_before_action :authenticate_user
  
  def create
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user != nil
      sign_in(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "No user found"
      render 'users/new'
    end
  end
  
  def destroy
    sign_out
    redirect_to signup_path
  end
end
