class WikiController < ApplicationController
  def index
    @title="this is index of def"

  end
  
  def show
    @title="this is show of def"
    @page = params[:page].to_s
  end

end
