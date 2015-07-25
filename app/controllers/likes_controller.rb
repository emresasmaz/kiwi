class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id,
                     confession_id: params[:confession_id])
    redirect_to root_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    redirect_to root_path
  end
end