require 'net/http'
require 'json'

require_relative '../utils/constants'

class Fetcher
  API_URL = URI(MeowFactsApi::BASE_URI)
  VALID_PARAMS = MeowFactsApi::VALID_PARAMS

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    response = Net::HTTP.get_response(API_URL)
    JSON.parse(response.body)
  end
end
