class GiphyResponseParser

  def initialize(json_string)
    @json = JSON.parse(json_string)
  end

  def original_url(id)
    @json['data'].present? ? get_url(@json['data'][id]) : 'No results.'
  end

  def original_urls
    return 'No results.' unless @json['data'].present?
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
