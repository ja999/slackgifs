class GifsController < ApplicationController
  before_filter :get_required

  def index
    # TODO: Render something else than Ryan Gosling gifs. ;)
    response = get_giphy_response('Ryan Gosling')
    urls = Gif.get_urls(response)
    message = send_to_slack(ENV['post_url'], urls)
    render text: message
  end

  def search
    response = get_giphy_response(params[:text])
    urls = Gif.get_urls(response)
    message = send_to_slack(ENV['post_url'], urls)
    render text: message
  end

  def single_response_search
    response = get_giphy_response(params[:text])
    url = Gif.get_url(response, rand(0..9))
    message = send_to_slack(ENV['post_url'], url)
    render text: message
  end

  private

  def send_to_slack(channel, data)
    # TODO: put this into a service
    to_send = { text: data }.to_json

    uri = URI.parse(channel)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(
      uri.to_s,
      initheader = {
        'Content-Type' => 'application/json'
      }
    )
    req.body = to_send
    res = https.request(req)
    res.code == '200' ? 'Gif sent' : 'Gif not sent'
  end

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
