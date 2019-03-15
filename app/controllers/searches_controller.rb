class SearchesController < ApplicationController
  def index
    @searches = User.text_search(params[:query])
  end
end