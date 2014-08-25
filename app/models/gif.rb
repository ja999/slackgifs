class Gif < ActiveRecord::Base

  def self.get_urls(json_string)
    response_parser = ::GiphyResponseParser.new(json_string)
    response_parser.original_urls
  end

  def self.get_url(json_string, id)
    response_parser = ::GiphyResponseParser.new(json_string)
    response_parser.original_url(id)
  end
end
