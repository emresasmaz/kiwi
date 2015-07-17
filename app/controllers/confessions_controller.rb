class ConfessionsController < ApplicationController
  def index
    @confessions = Confession.all
  end
  
  def new
   @confession = Confession.new
  end
  
  def edit
  @confession = Confession.find(params[:id])
  end
  
  def create
    @confession = Confession.new(confession_params)
    @confession.user_id = User.first.id

    if @confession.save
      redirect_to confession_path(@confession.id)
    else
      render 'new'
    end 
  end
  
  def update
  @confession = Confession.find(params[:id])
 
  if @confession.update(confession_params)
    redirect_to @confession
  else
    render 'edit'
  end
end
  
  def show
    @confession = Confession.find(params[:id])
  end
  
  def destroy
    @confession = Confession.find(params[:id])
    @confession.destroy
 
    redirect_to home_path
  end
  private
  def confession_params
    params.require(:confession).permit(:title, :content)
  end
  
end
