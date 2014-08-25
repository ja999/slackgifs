class GifsController < ApplicationController
  before_filter :get_required

  def index
    # TODO: Render something else than Ryan Goslling gifs. ;)
    url = "http://api.giphy.com/v1/gifs/search?q=ryan+gosling&api_key=dc6zaTOxFJmzC&limit=5"
    response = Net::HTTP.get_response(URI.parse(url)).body
    render text: Gif.get_urls(response)
  end

  def search
    render json: []
  end

  private

  def get_required
    require 'net/http'
  end
end
