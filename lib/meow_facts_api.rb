# frozen_string_literal: true

require_relative 'meow_facts_api/version'
require 'net/http'
require 'json'

module MeowFactsApi
  API_URL = URI('https://meowfacts.herokuapp.com/')

  class << self
    def fact
      response = Net::HTTP.get_response(API_URL)
      JSON.parse(response.body)
    rescue StandardError => e
      {
        'error' => "Error fetching cat fact: #{e.message}"
      }.to_json
    end
  end
end
