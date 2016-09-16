require 'csv'
require 'open-uri'
require 'json'

class Api
  def searcher(tag)
    api_url = "http://api.giphy.com/v1/gifs/search?q=#{tag}&api_key=dc6zaTOxFJmzC"
    open(api_url) do |stream|
      response = JSON.parse(stream.read)
      if response["data"] != []
        result = response["data"].sample["images"]["fixed_height"]["url"]
      else
        result = 'http://media1.giphy.com/media/F9AU77Krzw8ta/200.gif'
      end
    end
  end
end
