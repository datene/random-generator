require 'open-uri'
require 'nokogiri'
require 'sinatra'
require_relative 'scrape'
require_relative 'api'


get '/' do
  adjectives = generate_adjectives
  @result = "#{adjectives[0].capitalize} #{adjectives[1].capitalize} #{suffix}"
  @background = Api.new.searcher(@result)
  erb :result
end

