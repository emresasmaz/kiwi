class ConfessionsController < ApplicationController
  def index
    @confessions = Confession.all
  end
  
  def new
   @confessions = Confession.new
  end
end
