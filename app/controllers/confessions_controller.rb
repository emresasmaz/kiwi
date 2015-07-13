class ConfessionsController < ApplicationController
  
  def index
    @confessions = Confession.all
  end
  
end