class LikesController < ApplicationController
  def new

  end

  def create
    @like = Like.create(user_id :current_user.id,
                     confesssion_id: Confession)
  end

end