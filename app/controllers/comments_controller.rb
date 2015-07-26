class CommentsController < ApplicationController
  def create
    @confession = Confession.find(params[:confession_id])
    @comment = @confession.comments.create(comment_params)
    redirect_to confession_path(@confession)
  end

  def destroy
    @confession = Confession.find(params[:confession_id])
    @comment = @confession.comments.find(params[:id])
    @comment.destroy
    redirect_to confession_path(@confession)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end
end
