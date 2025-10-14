class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @range = params[:range]      
    @match = params[:match]        
    @word  = params[:word]

    if @range == "users"
      @results = User.search_by(@word, @match)
    else
      @results = Post.search_by(@word, @match)
    end
  end

end
