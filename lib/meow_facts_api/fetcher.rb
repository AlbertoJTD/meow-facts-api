require 'net/http'
require 'json'

module MeowFactsApi
  module Fetcher
    API_URL = URI('https://meowfacts.herokuapp.com/')

    def self.fact
      response = Net::HTTP.get_response(API_URL)
      JSON.parse(response.body)
    end
  end
end
