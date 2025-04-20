# frozen_string_literal: true

require_relative 'meow_facts_api/version'
require_relative 'meow_facts_api/error_handling'

require 'net/http'
require 'json'

module MeowFactsApi
  extend ErrorHandling

  API_URL = URI('https://meowfacts.herokuapp.com/')

  class << self
    def fact
      response = Net::HTTP.get_response(API_URL)
      JSON.parse(response.body)
    rescue StandardError => e
      handle_error(e)
    end
  end
end
