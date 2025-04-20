# frozen_string_literal: true

require_relative './config/setup'
require_relative './meow_facts_api/error_handling'
require_relative './meow_facts_api/fetcher'

module MeowFactsApi
  extend ErrorHandling
  extend Fetcher

  class << self
    def fact
      MeowFactsApi::Fetcher.fact
    rescue StandardError => e
      handle_error(e)
    end
  end
end
