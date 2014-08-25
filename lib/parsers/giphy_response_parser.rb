class GiphyResponseParser

  def initialize(json_string)
    @json = JSON.parse(json_string)
  end

  def original_url(id)
    get_url(@json['data'][id])
  end

  def original_urls
    urls = []
    @json['data'].each do |wrapped_gif|
      urls << get_url(wrapped_gif)
    end
    urls
  end

  private

  def get_url(wrapped_gif)
    wrapped_gif['images']['original']['url']
  end
end
