class ConfessionsController < ApplicationController
  before_action :set_confession, only: [:edit, :update, :destroy, :show]
  before_action :can_update_or_delete, only: [:edit, :update, :destroy]
  
  def index
    @confessions = Confession.order('created_at DESC')
    @confessions = @confessions.where(user_id: params[:user_id].to_i) if params[:user_id]
  end

  def new
    @confession = Confession.new
  end

  def edit
  end

  def create
    @confession = Confession.new(confession_params)
    @confession.user_id = current_user.id

    if @confession.save
      redirect_to confession_path(@confession.id)
    else
      render 'new'
    end
  end

  def update
    if @confession.update(confession_params)
      redirect_to @confession
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @confession.destroy

    redirect_to root_path
  end

  private

  def confession_params
    params.require(:confession).permit(:title, :content)
  end
  
  def set_confession
    @confession = Confession.find(params[:id])
  end

  def can_update_or_delete
    if @confession.user_id != current_user.id
      redirect_to confession_path(@confession.id)
    end
  end

end
