class LikesController < ApplicationController

  def create
    @like = Like.new(user_id: current_user.id,
                     confession_id: Confession.id)
  end

end