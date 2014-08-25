class GifsController < ApplicationController
  before_filter :get_required

  def index
    # TODO: Render something else than Ryan Gosling gifs. ;)
    url = search_url('Ryan Gosling')
    response = Net::HTTP.get_response(URI.parse(url)).body
    render text: Gif.get_urls(response)
  end

  def search
    render json: []
  end

  private

  def get_required
    require 'net/http'
    require 'open-uri'
  end

  def search_url(phrase)
    URI.escape("http://api.giphy.com/v1/gifs/search?q=#{ phrase }&api_key=dc6zaTOxFJmzC&limit=10")
  end
end
