require 'net/http'
require 'json'

require_relative '../utils/constants'

class Fetcher
  API_URL = URI(MeowFactsApi::BASE_URI)

  class << self
    def call
      response = Net::HTTP.get_response(API_URL)
      JSON.parse(response.body)
    end
  end
end
