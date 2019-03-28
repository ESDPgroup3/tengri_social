class SearchesController < ApplicationController
  def index
    @searches = User.text_search(params[:query])
  end

  def phone_search
    @phones = User.phone_search(params[:query])
  end

  def hashtag_search
    @hashtags = Tag.hashtag_search(params[:query])
  end
end