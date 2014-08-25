class GifsController < ApplicationController
  before_filter :get_required

  def index
    # TODO: Render something else than Ryan Gosling gifs. ;)
    response = get_giphy_response('Ryan Gosling')
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

  def get_giphy_response(phrase)
    url = search_url(phrase)
    Net::HTTP.get_response(URI.parse(url)).body
  end

  def search_url(phrase)
    URI.escape("http://api.giphy.com/v1/gifs/search?q=#{ phrase }&api_key=dc6zaTOxFJmzC&limit=10")
  end
end
