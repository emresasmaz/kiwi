class UsersController < ApplicationController
   def index
    @users = User.all
  end
   
   def new
   @user = User.new
  end
  
  def create
    #params[:username] params[:password] 
    @user = User.new(username: params[:username] , password: params[:password])
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end 
  end
end