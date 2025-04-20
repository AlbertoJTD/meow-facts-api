require 'net/http'
require 'json'

require_relative '../utils/constants'

class Fetcher
  API_URL = URI(MeowFactsApi::BASE_URI)
  VALID_PARAMS = MeowFactsApi::VALID_PARAMS

  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def call
    uri = API_URL
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end
end
