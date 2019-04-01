class SearchesController < ApplicationController
  def index
    @searches = User.text_search(params[:query])
  end

  def phone_search
    mask_delete
    @phones = User.phone_search(@query)
  end

  def hashtag_search
    @hashtags = Tag.hashtag_search(params[:query])
  end

  private
  def mask_delete
    if params[:query] != nil && params[:query].length >= 5
      arr = []
      arr = params[:query].split(') ')
      arr[1] = arr[1].split(' ')
      @query = arr.join('')
    elsif params[:query] != nil && params[:query].length < 4
      @query = params[:query]
    end
    return @query 
  end
end