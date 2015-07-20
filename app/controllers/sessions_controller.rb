class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def new
  end
  
  def create
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user != nil
      sign_in(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "No user found"
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to sign_in_path
  end
end
