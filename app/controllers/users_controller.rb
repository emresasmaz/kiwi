class UsersController < ApplicationController
  skip_before_action :authenticate_user
  def new
  end

  def create
    @user = User.new(username: params[:username],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      sign_in(@user)
      redirect_to root_path
    else
      render 'new'
    end
  end
end
